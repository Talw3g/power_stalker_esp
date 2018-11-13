EESchema Schematic File Version 4
LIBS:power_stalker_esp-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR09
U 1 1 5BE94315
P 4300 4050
F 0 "#PWR09" H 4300 3800 50  0001 C CNN
F 1 "GND" H 4305 3877 50  0000 C CNN
F 2 "" H 4300 4050 50  0001 C CNN
F 3 "" H 4300 4050 50  0001 C CNN
	1    4300 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q2
U 1 1 5BE9435A
P 4700 3450
F 0 "Q2" H 4891 3496 50  0000 L CNN
F 1 "Q_NPN_BEC" H 4891 3405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4900 3550 50  0001 C CNN
F 3 "~" H 4700 3450 50  0001 C CNN
F 4 "2464062" H 4700 3450 50  0001 C CNN "Farnell"
F 5 "MMBT2484LT1G" H 4700 3450 50  0001 C CNN "Ref"
	1    4700 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5BE943F3
P 3800 3700
F 0 "C1" H 3915 3746 50  0000 L CNN
F 1 "0.1uF/50V" H 3915 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3838 3550 50  0001 C CNN
F 3 "~" H 3800 3700 50  0001 C CNN
	1    3800 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5BE944CC
P 4200 3450
F 0 "R1" V 3993 3450 50  0000 C CNN
F 1 "100k" V 4084 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4130 3450 50  0001 C CNN
F 3 "~" H 4200 3450 50  0001 C CNN
	1    4200 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5BE94578
P 4800 2950
F 0 "R2" H 4730 2904 50  0000 R CNN
F 1 "4.7k" H 4730 2995 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4730 2950 50  0001 C CNN
F 3 "~" H 4800 2950 50  0001 C CNN
	1    4800 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	4800 2800 4800 2750
$Comp
L power:+3.3V #PWR08
U 1 1 5BE94675
P 4300 2700
F 0 "#PWR08" H 4300 2550 50  0001 C CNN
F 1 "+3.3V" H 4315 2873 50  0000 C CNN
F 2 "" H 4300 2700 50  0001 C CNN
F 3 "" H 4300 2700 50  0001 C CNN
	1    4300 2700
	1    0    0    -1  
$EndComp
$Comp
L logical_custom:74HC393 U1
U 1 1 5BE94C76
P 7350 4200
F 0 "U1" H 7350 5465 50  0000 C CNN
F 1 "74HC393" H 7350 5374 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7350 4450 50  0001 C CNN
F 3 "" H 7350 4450 50  0001 C CNN
F 4 "1085344" H 7350 4200 50  0001 C CNN "Farnell"
F 5 "74HC393D" H 7350 4200 50  0001 C CNN "Ref"
	1    7350 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 3200 8000 3200
Wire Wire Line
	8000 3200 8000 3050
$Comp
L power:+3.3V #PWR011
U 1 1 5BE95496
P 8000 3050
F 0 "#PWR011" H 8000 2900 50  0001 C CNN
F 1 "+3.3V" H 8015 3223 50  0000 C CNN
F 2 "" H 8000 3050 50  0001 C CNN
F 3 "" H 8000 3050 50  0001 C CNN
	1    8000 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4100 6700 4100
Wire Wire Line
	6700 4100 6700 4200
$Comp
L power:GND #PWR010
U 1 1 5BE955B7
P 6700 4200
F 0 "#PWR010" H 6700 3950 50  0001 C CNN
F 1 "GND" H 6705 4027 50  0000 C CNN
F 2 "" H 6700 4200 50  0001 C CNN
F 3 "" H 6700 4200 50  0001 C CNN
	1    6700 4200
	1    0    0    -1  
$EndComp
NoConn ~ 7850 3350
NoConn ~ 7850 3500
NoConn ~ 7850 3650
NoConn ~ 7850 3800
NoConn ~ 7850 3950
NoConn ~ 7850 4100
Wire Wire Line
	4800 3650 4800 3950
Wire Wire Line
	4050 3450 3800 3450
Wire Wire Line
	3800 3450 3800 3550
Wire Wire Line
	3800 3850 3800 3950
Wire Wire Line
	3800 3950 4300 3950
Wire Wire Line
	4350 3450 4500 3450
Wire Wire Line
	3800 2750 4300 2750
Wire Wire Line
	4300 4050 4300 3950
Connection ~ 4300 3950
Wire Wire Line
	4300 3950 4800 3950
Wire Wire Line
	4300 2700 4300 2750
Connection ~ 4300 2750
Wire Wire Line
	4300 2750 4800 2750
$Comp
L Device:Q_Photo_NPN Q1
U 1 1 5BE97372
P 3700 3100
F 0 "Q1" H 3450 3150 50  0000 L CNN
F 1 "Phototrans" H 3200 3050 50  0000 L CNN
F 2 "w_conn_mpt:mpt_0,5-2-2,54" H 3900 3200 50  0001 C CNN
F 3 "~" H 3700 3100 50  0001 C CNN
F 4 "1497675" H 3700 3100 50  0001 C CNN "Farnell"
F 5 "TEPT4400" H 3700 3100 50  0001 C CNN "Ref"
	1    3700 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2750 3800 2900
Wire Wire Line
	3800 3300 3800 3450
Connection ~ 3800 3450
Wire Wire Line
	4800 3100 4800 3200
Wire Wire Line
	4800 3200 6850 3200
Connection ~ 4800 3200
Wire Wire Line
	4800 3200 4800 3250
Text GLabel 6200 3350 0    50   Input ~ 0
MASTER_RESET
Text GLabel 6850 3500 0    50   Output ~ 0
1Q0
Text GLabel 6850 3650 0    50   Output ~ 0
1Q1
Text GLabel 6850 3800 0    50   Output ~ 0
1Q2
Text GLabel 6850 3950 0    50   Output ~ 0
1Q3
$Comp
L Device:R R3
U 1 1 5BE97F5E
P 6350 3750
F 0 "R3" H 6280 3704 50  0000 R CNN
F 1 "10k" H 6280 3795 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6280 3750 50  0001 C CNN
F 3 "~" H 6350 3750 50  0001 C CNN
	1    6350 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	6350 3900 6350 4100
Wire Wire Line
	6350 4100 6700 4100
Connection ~ 6700 4100
Wire Wire Line
	6350 3600 6350 3350
Wire Wire Line
	6350 3350 6200 3350
Wire Wire Line
	6350 3350 6850 3350
Connection ~ 6350 3350
$EndSCHEMATC
