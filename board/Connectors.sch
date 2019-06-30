EESchema Schematic File Version 4
LIBS:power_stalker_esp-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L Connector_Generic:Conn_01x15 J2
U 1 1 5BE94184
P 3350 2300
F 0 "J2" H 3430 2342 50  0000 L CNN
F 1 "LEFT" H 3430 2251 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 3350 2300 50  0001 C CNN
F 3 "~" H 3350 2300 50  0001 C CNN
F 4 "2779587" H 3350 2300 50  0001 C CNN "Farnell"
F 5 "SSW-115-01-T-S" H 3350 2300 50  0001 C CNN "Ref"
	1    3350 2300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x15 J3
U 1 1 5BE9418B
P 5150 2300
F 0 "J3" H 5229 2342 50  0000 L CNN
F 1 "RIGHT" H 5229 2251 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 5150 2300 50  0001 C CNN
F 3 "~" H 5150 2300 50  0001 C CNN
F 4 "2779587" H 5150 2300 50  0001 C CNN "Farnell"
F 5 "SSW-115-01-T-S" H 5150 2300 50  0001 C CNN "Ref"
	1    5150 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1700 2350 1700
Wire Wire Line
	2350 1700 2350 2500
$Comp
L power:GND #PWR03
U 1 1 5BE94194
P 2350 3200
F 0 "#PWR03" H 2350 2950 50  0001 C CNN
F 1 "GND" H 2355 3027 50  0000 C CNN
F 2 "" H 2350 3200 50  0001 C CNN
F 3 "" H 2350 3200 50  0001 C CNN
	1    2350 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2900 2350 2900
Connection ~ 2350 2900
Wire Wire Line
	2350 2900 2350 3200
Wire Wire Line
	3150 2500 2350 2500
Connection ~ 2350 2500
Wire Wire Line
	2350 2500 2350 2900
Wire Wire Line
	4950 2900 4200 2900
Wire Wire Line
	4200 2900 4200 3200
$Comp
L power:GND #PWR07
U 1 1 5BE941A2
P 4200 3200
F 0 "#PWR07" H 4200 2950 50  0001 C CNN
F 1 "GND" H 4205 3027 50  0000 C CNN
F 2 "" H 4200 3200 50  0001 C CNN
F 3 "" H 4200 3200 50  0001 C CNN
	1    4200 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2200 4200 2200
Wire Wire Line
	4200 2200 4200 2900
Connection ~ 4200 2900
Wire Wire Line
	3150 3000 2200 3000
Wire Wire Line
	2200 3000 2200 2900
$Comp
L power:+5V #PWR02
U 1 1 5BE941AD
P 2200 2900
F 0 "#PWR02" H 2200 2750 50  0001 C CNN
F 1 "+5V" H 2215 3073 50  0000 C CNN
F 2 "" H 2200 2900 50  0001 C CNN
F 3 "" H 2200 2900 50  0001 C CNN
	1    2200 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2600 2050 2600
Wire Wire Line
	1750 2600 1750 2500
$Comp
L power:+3.3V #PWR01
U 1 1 5BE941B5
P 1750 2500
F 0 "#PWR01" H 1750 2350 50  0001 C CNN
F 1 "+3.3V" H 1765 2673 50  0000 C CNN
F 2 "" H 1750 2500 50  0001 C CNN
F 3 "" H 1750 2500 50  0001 C CNN
	1    1750 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3000 4050 3000
Wire Wire Line
	4050 3000 4050 2100
Wire Wire Line
	4950 2100 4050 2100
Connection ~ 4050 2100
Wire Wire Line
	4050 2100 4050 2000
$Comp
L power:+3.3V #PWR06
U 1 1 5BE941C0
P 4050 2000
F 0 "#PWR06" H 4050 1850 50  0001 C CNN
F 1 "+3.3V" H 4065 2173 50  0000 C CNN
F 2 "" H 4050 2000 50  0001 C CNN
F 3 "" H 4050 2000 50  0001 C CNN
	1    4050 2000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5BE99158
P 2300 5750
F 0 "J1" H 2350 5450 50  0000 C CNN
F 1 "POWER IN" H 2400 5550 50  0000 C CNN
F 2 "w_conn_mpt:mpt_0,5-2-2,54" H 2300 5750 50  0001 C CNN
F 3 "~" H 2300 5750 50  0001 C CNN
F 4 "3041359" H 2300 5750 50  0001 C CNN "Farnell"
F 5 "1725656" H 2300 5750 50  0001 C CNN "Ref"
	1    2300 5750
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5BE999EC
P 3050 5800
F 0 "#PWR05" H 3050 5550 50  0001 C CNN
F 1 "GND" H 3055 5627 50  0000 C CNN
F 2 "" H 3050 5800 50  0001 C CNN
F 3 "" H 3050 5800 50  0001 C CNN
	1    3050 5800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5BE999FD
P 3050 5550
F 0 "#PWR04" H 3050 5400 50  0001 C CNN
F 1 "+5V" H 3065 5723 50  0000 C CNN
F 2 "" H 3050 5550 50  0001 C CNN
F 3 "" H 3050 5550 50  0001 C CNN
	1    3050 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5650 2700 5650
Wire Wire Line
	3050 5650 3050 5550
Wire Wire Line
	2500 5750 2700 5750
Wire Wire Line
	3050 5750 3050 5800
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5BE99DBB
P 2700 5650
F 0 "#FLG01" H 2700 5725 50  0001 C CNN
F 1 "PWR_FLAG" H 2700 5824 50  0000 C CNN
F 2 "" H 2700 5650 50  0001 C CNN
F 3 "~" H 2700 5650 50  0001 C CNN
	1    2700 5650
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5BE99DD5
P 2700 5750
F 0 "#FLG02" H 2700 5825 50  0001 C CNN
F 1 "PWR_FLAG" H 2700 5923 50  0000 C CNN
F 2 "" H 2700 5750 50  0001 C CNN
F 3 "~" H 2700 5750 50  0001 C CNN
	1    2700 5750
	-1   0    0    1   
$EndComp
Connection ~ 2700 5750
Wire Wire Line
	2700 5750 3050 5750
Connection ~ 2700 5650
Wire Wire Line
	2700 5650 3050 5650
Text GLabel 4950 2500 0    50   Output ~ 0
MASTER_RESET
Text GLabel 4950 1700 0    50   Input ~ 0
1Q0
Text GLabel 4950 1800 0    50   Input ~ 0
1Q1
Text GLabel 4950 2300 0    50   Input ~ 0
1Q2
Text GLabel 4950 2400 0    50   Input ~ 0
1Q3
NoConn ~ 3150 1600
NoConn ~ 3150 1800
NoConn ~ 3150 1900
NoConn ~ 3150 2000
NoConn ~ 3150 2100
NoConn ~ 3150 2200
NoConn ~ 3150 2300
NoConn ~ 3150 2400
NoConn ~ 3150 2700
NoConn ~ 3150 2800
NoConn ~ 4950 2600
NoConn ~ 4950 2700
NoConn ~ 4950 2800
$Comp
L power:PWR_FLAG #FLG03
U 1 1 5BE9CBC2
P 2050 2600
F 0 "#FLG03" H 2050 2675 50  0001 C CNN
F 1 "PWR_FLAG" H 2050 2774 50  0000 C CNN
F 2 "" H 2050 2600 50  0001 C CNN
F 3 "~" H 2050 2600 50  0001 C CNN
	1    2050 2600
	1    0    0    -1  
$EndComp
Connection ~ 2050 2600
Wire Wire Line
	2050 2600 1750 2600
NoConn ~ 4950 2000
NoConn ~ 4950 1900
NoConn ~ 4950 1600
$EndSCHEMATC
