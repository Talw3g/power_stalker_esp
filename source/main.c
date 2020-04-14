#include "espressif/esp_common.h"
#include "esp/uart.h"

#include <string.h>

#include <FreeRTOS.h>
#include <task.h>
#include <ssid_config.h>
#include <queue.h>
#include <math.h>

#include <espressif/esp_sta.h>
#include <espressif/esp_wifi.h>

#include <paho_mqtt_c/MQTTESP8266.h>
#include <paho_mqtt_c/MQTTClient.h>

#include <semphr.h>
#include <timers.h>


/* You can use http://test.mosquitto.org/ to test mqtt_client instead
 * of setting up your own MQTT server */
#define MQTT_HOST ("10.0.0.40")
#define MQTT_PORT 1883

#define MQTT_USER NULL
#define MQTT_PASS NULL

SemaphoreHandle_t wifi_alive;
QueueHandle_t publish_queue;
#define PUB_MSG_LEN 48

/* flash pin config */
const int input_gpio = 12;
const int active = 0; /* active == 0 for active low */
const gpio_inttype_t int_type = GPIO_INTTYPE_EDGE_ANY;
TimerHandle_t timer_handle;

const int led_gpio = 2;


static void  topic_received(mqtt_message_data_t *md)
{
    int i;
    mqtt_message_t *message = md->message;
    printf("Received: ");
    for( i = 0; i < md->topic->lenstring.len; ++i)
        printf("%c", md->topic->lenstring.data[ i ]);

    printf(" = ");
    for( i = 0; i < (int)message->payloadlen; ++i)
        printf("%c", ((char *)(message->payload))[i]);

    printf("\r\n");
}

static const char *  get_my_id(void)
{
    // Use MAC address for Station as unique ID
    static char my_id[13];
    static bool my_id_done = false;
    int8_t i;
    uint8_t x;
    if (my_id_done)
        return my_id;
    if (!sdk_wifi_get_macaddr(STATION_IF, (uint8_t *)my_id))
        return NULL;
    for (i = 5; i >= 0; --i)
    {
        x = my_id[i] & 0x0F;
        if (x > 9) x += 7;
        my_id[i * 2 + 1] = x + '0';
        x = my_id[i] >> 4;
        if (x > 9) x += 7;
        my_id[i * 2] = x + '0';
    }
    my_id[12] = '\0';
    my_id_done = true;
    return my_id;
}

static void  mqtt_task(void *pvParameters)
{
    int ret         = 0;
    struct mqtt_network network;
    mqtt_client_t client   = mqtt_client_default;
    char mqtt_client_id[20];
    uint8_t mqtt_buf[100];
    uint8_t mqtt_readbuf[100];
    mqtt_packet_connect_data_t data = mqtt_packet_connect_data_initializer;

    mqtt_network_new( &network );
    memset(mqtt_client_id, 0, sizeof(mqtt_client_id));
    strcpy(mqtt_client_id, "PwSTLK-");
    strcat(mqtt_client_id, get_my_id());

    while(1) {
        xSemaphoreTake(wifi_alive, portMAX_DELAY);
        printf("%s: started\n\r", __func__);
        printf("%s: (Re)connecting to MQTT server %s ... ",__func__,
               MQTT_HOST);
        ret = mqtt_network_connect(&network, MQTT_HOST, MQTT_PORT);
        if( ret ){
            printf("error: %d\n\r", ret);
            taskYIELD();
            vTaskDelay( 1000 / portTICK_PERIOD_MS );
            continue;
        }
        printf("done\n\r");
        mqtt_client_new(&client, &network, 5000, mqtt_buf, 100,
                      mqtt_readbuf, 100);

        data.willFlag       = 0;
        data.MQTTVersion    = 3;
        data.clientID.cstring   = mqtt_client_id;
        data.username.cstring   = MQTT_USER;
        data.password.cstring   = MQTT_PASS;
        data.keepAliveInterval  = 10;
        data.cleansession   = 0;
        printf("Send MQTT connect ... ");
        ret = mqtt_connect(&client, &data);
        if(ret){
            printf("error: %d\n\r", ret);
            mqtt_network_disconnect(&network);
            taskYIELD();
            continue;
        }
        printf("done\r\n");
        mqtt_subscribe(&client, "/esptopic", MQTT_QOS1, topic_received);
        xQueueReset(publish_queue);

        while(1){

            char msg[PUB_MSG_LEN] = "\0";
            while(xQueueReceive(publish_queue, (void *)msg, 0) ==
                  pdTRUE){
                printf("got message to publish\r\n");
                mqtt_message_t message;
                message.payload = msg;
                message.payloadlen = strlen(msg);
                message.dup = 0;
                message.qos = MQTT_QOS1;
                message.retained = 0;
                ret = mqtt_publish(&client, "power", &message);
                if (ret != MQTT_SUCCESS ){
                    printf("error while publishing message: %d\n", ret );
                    break;
                }
            }

            ret = mqtt_yield(&client, 50);
            if (ret == MQTT_DISCONNECTED)
              break;
            vTaskDelay( 10 / portTICK_PERIOD_MS );
        }
        printf("Connection dropped, request restart\n\r");
        mqtt_network_disconnect(&network);
        xSemaphoreGive( wifi_alive );
        taskYIELD();
    }
}

static void  wifi_task(void *pvParameters)
{
    printf("%s: started\n\r", __func__);
    uint8_t status  = 0;
    uint8_t retries = 30;
    struct sdk_station_config config = {
        .ssid = WIFI_SSID,
        .password = WIFI_PASS,
    };

    printf("WiFi: connecting to WiFi\n\r");
    sdk_wifi_set_opmode(STATION_MODE);
    sdk_wifi_station_set_config(&config);

    while(1)
    {
        while ((status != STATION_GOT_IP) && (retries)){
            status = sdk_wifi_station_get_connect_status();
            printf("%s: status = %d\n\r", __func__, status );
            if( status == STATION_WRONG_PASSWORD ){
                printf("WiFi: wrong password\n\r");
                break;
            } else if( status == STATION_NO_AP_FOUND ) {
                printf("WiFi: AP not found\n\r");
                break;
            } else if( status == STATION_CONNECT_FAIL ) {
                printf("WiFi: connection failed\r\n");
                break;
            }
            vTaskDelay( 1000 / portTICK_PERIOD_MS );
            --retries;
        }
        if (status == STATION_GOT_IP) {
            printf("WiFi: Connected\n\r");
            xSemaphoreGive( wifi_alive );
            taskYIELD();
        }

        while ((status = sdk_wifi_station_get_connect_status()) == STATION_GOT_IP) {
            xSemaphoreGive( wifi_alive );
            taskYIELD();
        }
        printf("WiFi: disconnected\n\r");
        sdk_wifi_station_disconnect();
        vTaskDelay( 1000 / portTICK_PERIOD_MS );
    }
}

static QueueHandle_t tsqueue;

void gpio_intr_handler(uint8_t gpio_num)
{
  BaseType_t plouf;
  xTimerResetFromISR(timer_handle, &plouf);
}

void timer_handler( TimerHandle_t timer) {
    if( !gpio_read(input_gpio)) {
      uint32_t now = xTaskGetTickCountFromISR();
      xQueueSendToBackFromISR(tsqueue, &now, NULL);
    }

}

struct Flash {
  uint32_t previous_ts;
  uint32_t ts;
  float power;
};

void get_inst_power(struct Flash *flash) {
  if(!flash->previous_ts) {
    printf("First flash!\n\r");
    flash->previous_ts = flash->ts;
    flash->power = NAN;
    return;
  }
  else if(flash->ts - flash->previous_ts < 300.) {
    printf("Duplication\n\r");
    flash->power = NAN;
    return;
  }
  uint32_t delta = flash->ts - flash->previous_ts;
  float power = 3600000. / delta;
  flash->power = power;
  flash->previous_ts = flash->ts;
}

void blink_led(void) {
  gpio_write(led_gpio, 0);
  vTaskDelay(20 / portTICK_PERIOD_MS);
  gpio_write(led_gpio, 1);
  vTaskDelay(20 / portTICK_PERIOD_MS);
}

void flashIntTask(void *pvParameters)
{
    //char msg[PUB_MSG_LEN] = {'\0'};
    char msg[4] = {'\0'};
    QueueHandle_t *tsqueue = (QueueHandle_t *)pvParameters;
    gpio_set_interrupt(input_gpio, int_type, gpio_intr_handler);
    gpio_enable(led_gpio, GPIO_OUTPUT);
    gpio_write(led_gpio, 1);

    struct Flash flash;
//    flash.previous_ts = 0;
    while(1) {
      xQueueReceive(*tsqueue, &flash.ts, portMAX_DELAY);
      blink_led();
      flash.ts *= portTICK_PERIOD_MS;
      get_inst_power(&flash);
      if(!isnan(flash.power)) {
        snprintf(msg, PUB_MSG_LEN, "{\"offset\":0, \"length\":4, \"value\":%.2f}", flash.power);
        if (xQueueSend(publish_queue, (void *)msg, 0) == pdFALSE) {
            printf("Publish queue overflow.\r\n");
        }
        printf("Flash interrupt fired at %dms\r\n    Power: %.2fW\n\r", flash.ts, flash.power);
      }
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);
    printf("SDK version:%s\n\r", sdk_system_get_sdk_version());
    gpio_enable(input_gpio, GPIO_INPUT);

    timer_handle = xTimerCreate("xtimer", 1, false, 0, timer_handler);

    tsqueue = xQueueCreate(2, sizeof(uint32_t));

    vSemaphoreCreateBinary(wifi_alive);
    publish_queue = xQueueCreate(10, PUB_MSG_LEN);
    xTaskCreate(&wifi_task, "wifi_task",  256, NULL, 2, NULL);
    xTaskCreate(&mqtt_task, "mqtt_task", 1024, NULL, 3, NULL);
    xTaskCreate(flashIntTask, "flashIntTask", 1024, &tsqueue, 4, NULL);
}
