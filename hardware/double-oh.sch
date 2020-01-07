EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Battery_Management:MCP73831-2-OT U3
U 1 1 5CDCF91B
P 1900 1400
F 0 "U3" H 1900 1925 50  0000 C CNN
F 1 "MCP73831-2-OT" H 1900 1825 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 1950 1150 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 1750 1350 50  0001 C CNN
	1    1900 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5CDD07D2
P 1275 1250
F 0 "C1" H 1150 1175 50  0000 R CNN
F 1 "4.7μF" H 1150 1275 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1275 1250 50  0001 C CNN
F 3 "~" H 1275 1250 50  0001 C CNN
	1    1275 1250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small_US R1
U 1 1 5CDD2A78
P 1450 1625
F 0 "R1" H 1350 1550 50  0000 R CNN
F 1 "2kΩ" H 1350 1650 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1450 1625 50  0001 C CNN
F 3 "~" H 1450 1625 50  0001 C CNN
	1    1450 1625
	1    0    0    1   
$EndComp
Wire Wire Line
	1900 1750 1900 1700
Wire Wire Line
	1275 1750 1275 1350
Wire Wire Line
	1275 1150 1275 1050
Wire Wire Line
	1900 1050 1900 1100
Wire Wire Line
	1275 1050 1900 1050
$Comp
L power:GNDREF #PWR?
U 1 1 5CDD38B8
P 1650 1750
F 0 "#PWR?" H 1650 1500 50  0001 C CNN
F 1 "GNDREF" H 1700 1525 50  0000 C CNN
F 2 "" H 1650 1750 50  0001 C CNN
F 3 "" H 1650 1750 50  0001 C CNN
	1    1650 1750
	1    0    0    -1  
$EndComp
Connection ~ 1650 1750
Wire Wire Line
	1650 1750 1900 1750
$Comp
L Device:C_Small C2
U 1 1 5CDD3E81
P 2600 1500
F 0 "C2" H 2500 1425 50  0000 R CNN
F 1 "4.7μF" H 2500 1525 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2600 1500 50  0001 C CNN
F 3 "~" H 2600 1500 50  0001 C CNN
	1    2600 1500
	-1   0    0    1   
$EndComp
Connection ~ 1900 1750
$Comp
L Device:LED_Small_ALT D1
U 1 1 5CDD6D74
P 2425 1150
F 0 "D1" V 2475 1050 50  0000 R CNN
F 1 "LED_Small_ALT" V 2425 1050 50  0000 R CNN
F 2 "LED_SMD:LED_0402_1005Metric" V 2425 1150 50  0001 C CNN
F 3 "~" V 2425 1150 50  0001 C CNN
	1    2425 1150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R3
U 1 1 5CDD7328
P 2200 1050
F 0 "R3" V 1975 1050 50  0000 C CNN
F 1 "470Ω" V 2075 1050 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 2200 1050 50  0001 C CNN
F 3 "~" H 2200 1050 50  0001 C CNN
	1    2200 1050
	0    -1   1    0   
$EndComp
Wire Wire Line
	2300 1050 2425 1050
Wire Wire Line
	2100 1050 1900 1050
Connection ~ 1900 1050
Wire Wire Line
	2425 1250 2425 1500
Wire Wire Line
	2425 1500 2300 1500
Text GLabel 3100 1100 1    50   Input ~ 0
LIPO_V
Text GLabel 3100 1875 3    50   Input ~ 0
0V
Wire Wire Line
	1900 1750 2600 1750
Wire Wire Line
	2300 1300 2600 1300
Wire Wire Line
	2600 1400 2600 1300
Connection ~ 2600 1300
Wire Wire Line
	2600 1600 2600 1750
Connection ~ 2600 1750
Text GLabel 1225 1050 0    50   Input ~ 0
USB_VIN
Wire Wire Line
	1225 1050 1275 1050
Connection ~ 1275 1050
Wire Wire Line
	1275 1750 1450 1750
Wire Wire Line
	1450 1750 1450 1725
Connection ~ 1450 1750
Wire Wire Line
	1450 1750 1650 1750
Wire Wire Line
	1450 1525 1450 1500
Wire Wire Line
	1450 1500 1500 1500
Text Notes 1000 825  0    50   ~ 0
USB LiPo Charging circuit
$Comp
L Device:Crystal_Small Y1
U 1 1 5CE12A59
P 7850 3825
F 0 "Y1" H 7850 3925 50  0000 C CNN
F 1 "26MHz" H 7850 3725 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_TXC_7M-4Pin_3.2x2.5mm" H 7850 3825 50  0001 C CNN
F 3 "~" H 7850 3825 50  0001 C CNN
	1    7850 3825
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5CE15BCA
P 5700 5375
F 0 "C6" H 5825 5400 50  0000 C CNN
F 1 "0.1μF" H 5875 5325 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5700 5375 50  0001 C CNN
F 3 "~" H 5700 5375 50  0001 C CNN
	1    5700 5375
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5CE1629E
P 5700 5750
F 0 "C7" H 5825 5775 50  0000 C CNN
F 1 "10μF" H 5875 5700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5700 5750 50  0001 C CNN
F 3 "~" H 5700 5750 50  0001 C CNN
	1    5700 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 6125 5600 6125
Wire Wire Line
	5825 5375 5800 5375
Wire Wire Line
	5825 5375 5825 5750
Wire Wire Line
	5825 5750 5800 5750
Connection ~ 5825 5375
Text Notes 6175 3375 0    50   ~ 0
ESP8285 2.4GHz SoC
Wire Wire Line
	2600 1750 3100 1750
Wire Wire Line
	2600 1300 3100 1300
Connection ~ 3100 1300
Connection ~ 3100 1750
$Comp
L Amplifier_Operational:LMV321 U4
U 1 1 5CE9E1F1
P 2725 2975
F 0 "U4" H 3100 3050 50  0000 L CNN
F 1 "LMV321" H 3100 2950 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-353_SC-70-5" H 2725 2975 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmv324.pdf" H 2725 2975 50  0001 C CNN
	1    2725 2975
	1    0    0    -1  
$EndComp
Text GLabel 1350 3275 0    50   Input ~ 0
0V
$Comp
L Regulator_Linear:AP2127N-3.3 U1
U 1 1 5CEA7DE4
P 3975 1300
F 0 "U1" H 3975 1600 50  0000 C CNN
F 1 "AP2127N-3.3" H 3975 1500 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3975 1525 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AP2127.pdf" H 3975 1300 50  0001 C CNN
	1    3975 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 3275 1750 3275
Wire Wire Line
	4275 1300 4950 1300
Text GLabel 2625 3275 2    50   Input ~ 0
0V
$Comp
L Device:R_Small_US R2
U 1 1 5CEB6273
P 1925 3275
F 0 "R2" H 1825 3200 50  0000 R CNN
F 1 "20kΩ" H 1825 3300 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1925 3275 50  0001 C CNN
F 3 "~" H 1925 3275 50  0001 C CNN
	1    1925 3275
	0    -1   1    0   
$EndComp
Wire Wire Line
	2100 3075 2425 3075
Text GLabel 2250 3375 3    50   Input ~ 0
digipot1
Text GLabel 2275 4225 2    50   Input ~ 0
digipot1
Text GLabel 2275 4325 2    50   Input ~ 0
digipot2
Text GLabel 2475 3375 3    50   Input ~ 0
digipot2
Wire Wire Line
	2100 3375 2250 3375
Wire Wire Line
	2475 3375 3075 3375
Wire Wire Line
	3075 3375 3075 2975
Wire Wire Line
	3075 2975 3025 2975
Wire Wire Line
	2075 4225 2275 4225
Wire Wire Line
	2275 4325 2075 4325
Text GLabel 1450 4725 0    50   Input ~ 0
0V
Text GLabel 3400 2975 2    50   Input ~ 0
batt_out
Wire Wire Line
	3400 2975 3075 2975
Connection ~ 3075 2975
Wire Wire Line
	9925 4625 9925 5000
Text GLabel 9925 5625 0    50   Input ~ 0
batt_out
Text GLabel 6725 5400 0    50   Input ~ 0
i2c_sda
Text GLabel 7400 5900 3    50   Input ~ 0
i2c_scl
Text GLabel 1275 4525 0    50   Input ~ 0
i2c_sda
Text GLabel 4950 1300 2    50   Input ~ 0
3.3V
Text GLabel 5825 4925 0    50   Input ~ 0
3.3V
Text GLabel 1350 2875 0    50   Input ~ 0
3.3V
$Comp
L Device:R_Small_US R5
U 1 1 5D50083D
P 1575 2875
F 0 "R5" H 1475 2800 50  0000 R CNN
F 1 "62kΩ" H 1475 2900 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1575 2875 50  0001 C CNN
F 3 "~" H 1575 2875 50  0001 C CNN
	1    1575 2875
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small_US R6
U 1 1 5D500F3A
P 1750 3075
F 0 "R6" H 1650 3000 50  0000 R CNN
F 1 "27kΩ" H 1650 3100 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1750 3075 50  0001 C CNN
F 3 "~" H 1750 3075 50  0001 C CNN
	1    1750 3075
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 2875 1475 2875
Wire Wire Line
	1675 2875 1750 2875
Wire Wire Line
	1750 2875 1750 2975
Wire Wire Line
	1750 3175 1750 3275
Wire Wire Line
	1750 2875 2425 2875
Connection ~ 1750 2875
Wire Wire Line
	2100 3075 2100 3275
Wire Wire Line
	1825 3275 1750 3275
Connection ~ 1750 3275
Wire Wire Line
	2025 3275 2100 3275
Connection ~ 2100 3275
Wire Wire Line
	2100 3275 2100 3375
Text GLabel 1450 4025 0    50   Input ~ 0
3.3V
Wire Wire Line
	1450 4025 1575 4025
$Comp
L double-oh:ESP8285 U5
U 1 1 5D4DC172
P 7750 5050
F 0 "U5" H 7750 5100 50  0000 C CNN
F 1 "ESP8285" H 7750 5000 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-32-1EP_5x5mm_P0.5mm_EP3.45x3.45mm" H 7750 3750 50  0001 C CNN
F 3 "" H 7850 3750 50  0001 C CNN
	1    7750 5050
	1    0    0    -1  
$EndComp
Text GLabel 6725 4700 0    50   Input ~ 0
3.3V
Wire Wire Line
	6725 4700 6900 4700
Wire Wire Line
	6900 4800 6275 4800
Text GLabel 6725 4900 0    50   Input ~ 0
3.3V
Wire Wire Line
	6725 4900 6900 4900
Text GLabel 6725 5000 0    50   Input ~ 0
3.3V
Wire Wire Line
	6725 5000 6900 5000
NoConn ~ 7500 5900
NoConn ~ 8600 4800
NoConn ~ 8600 4900
NoConn ~ 8600 5000
NoConn ~ 8600 5100
NoConn ~ 6900 5200
Wire Wire Line
	5600 5375 5600 5750
Connection ~ 5600 5750
Wire Wire Line
	5600 5750 5600 6125
Wire Wire Line
	3100 1100 3100 1300
Wire Wire Line
	3100 1875 3100 1750
Wire Wire Line
	3100 1750 3975 1750
Wire Wire Line
	3975 1600 3975 1750
Wire Wire Line
	3100 1300 3675 1300
Wire Wire Line
	1450 4725 1575 4725
$Comp
L Device:R_Small_US R8
U 1 1 5D570C7A
P 9325 5200
F 0 "R8" V 9250 5250 50  0000 R CNN
F 1 "1kΩ" V 9400 5275 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 9325 5200 50  0001 C CNN
F 3 "~" H 9325 5200 50  0001 C CNN
	1    9325 5200
	0    -1   1    0   
$EndComp
Text GLabel 6725 5300 0    50   Input ~ 0
EN
Wire Wire Line
	6725 5300 6900 5300
Wire Wire Line
	5825 4925 5825 5375
$Comp
L Device:C_Small C4
U 1 1 5D582245
P 7700 3675
F 0 "C4" H 7825 3700 50  0000 C CNN
F 1 "5.6pF" H 7875 3625 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7700 3675 50  0001 C CNN
F 3 "~" H 7700 3675 50  0001 C CNN
	1    7700 3675
	-1   0    0    1   
$EndComp
Wire Wire Line
	7800 4200 7800 4000
Wire Wire Line
	7900 4200 7900 4000
Wire Wire Line
	8000 4000 8000 3825
Wire Wire Line
	8000 3825 7950 3825
Wire Wire Line
	7900 4000 8000 4000
Wire Wire Line
	7700 4000 7700 3825
Wire Wire Line
	7700 3825 7750 3825
Wire Wire Line
	7700 4000 7800 4000
Wire Wire Line
	7700 3775 7700 3825
Connection ~ 7700 3825
$Comp
L Device:C_Small C5
U 1 1 5D591733
P 8000 3675
F 0 "C5" H 7875 3700 50  0000 C CNN
F 1 "5.6pF" H 7825 3625 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8000 3675 50  0001 C CNN
F 3 "~" H 8000 3675 50  0001 C CNN
	1    8000 3675
	-1   0    0    1   
$EndComp
Wire Wire Line
	8000 3775 8000 3825
Connection ~ 8000 3825
Text GLabel 7850 3350 1    50   Input ~ 0
0V
Wire Wire Line
	7850 3350 7850 3400
Wire Wire Line
	7850 3400 7700 3400
Wire Wire Line
	7700 3400 7700 3575
Wire Wire Line
	7850 3400 8000 3400
Wire Wire Line
	8000 3400 8000 3575
Connection ~ 7850 3400
$Comp
L Device:R_Small_US R7
U 1 1 5D50175B
P 7275 3950
F 0 "R7" V 7200 3950 50  0000 C CNN
F 1 "12kΩ" V 7125 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7275 3950 50  0001 C CNN
F 3 "~" H 7275 3950 50  0001 C CNN
	1    7275 3950
	0    -1   1    0   
$EndComp
Wire Wire Line
	7500 4200 7500 3950
Wire Wire Line
	7500 3950 7375 3950
Wire Wire Line
	7175 3950 7100 3950
Wire Wire Line
	7100 3950 7100 4200
Text GLabel 7100 3825 1    50   Input ~ 0
0V
Wire Wire Line
	7100 3825 7100 3950
Connection ~ 7100 3950
Text GLabel 7400 4200 1    50   Input ~ 0
3.3V
Text GLabel 7600 4125 1    50   Input ~ 0
3.3V
Wire Wire Line
	7600 4125 7600 4200
Wire Wire Line
	7700 4200 7600 4200
Text GLabel 8225 4075 2    50   Input ~ 0
TX_ESP
Text GLabel 8225 4175 2    50   Input ~ 0
RX_ESP
Wire Wire Line
	8100 4175 8100 4200
Wire Wire Line
	8000 4200 8000 4075
Text GLabel 8600 5400 2    50   Input ~ 0
3.3V
Text GLabel 8600 4700 2    50   Input ~ 0
0V
Text GLabel 5650 6125 2    50   Input ~ 0
0V
Text GLabel 7600 6200 3    50   Input ~ 0
3.3V
Text GLabel 8000 5900 3    50   Input ~ 0
GPIO0
$Comp
L Device:Q_DUAL_NPN_NPN_E1B1C2E2B2C1 Q2
U 1 1 5DFF9476
P 6650 1125
F 0 "Q2" H 6850 1175 50  0000 L CNN
F 1 "Q_DUAL_NPN_NPN_E1B1C2E2B2C1" H 6850 1125 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 6850 1225 50  0001 C CNN
F 3 "~" H 6650 1125 50  0001 C CNN
	1    6650 1125
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_DUAL_NPN_NPN_E1B1C2E2B2C1 Q2
U 2 1 5DFF9AE1
P 6650 1825
F 0 "Q2" H 6850 1750 50  0000 L CNN
F 1 "Q_DUAL_NPN_NPN_E1B1C2E2B2C1" H 6850 1850 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 6850 1925 50  0001 C CNN
F 3 "~" H 6650 1825 50  0001 C CNN
	2    6650 1825
	1    0    0    1   
$EndComp
Text GLabel 3575 6025 2    50   Input ~ 0
TX_USB
Text GLabel 3575 6125 2    50   Input ~ 0
RX_USB
Text GLabel 3575 6325 2    50   Input ~ 0
RTS
Text GLabel 3575 5725 2    50   Input ~ 0
DTR
Text GLabel 6750 2250 3    50   Input ~ 0
GPIO0
Text GLabel 6750 800  1    50   Input ~ 0
EN
Wire Wire Line
	6750 800  6750 925 
Text GLabel 6175 1825 0    50   Input ~ 0
RTS
Text GLabel 6175 1125 0    50   Input ~ 0
DTR
Wire Wire Line
	6175 1125 6250 1125
Wire Wire Line
	6450 1825 6350 1825
Wire Wire Line
	6750 1625 6250 1625
Wire Wire Line
	6250 1625 6250 1125
Connection ~ 6250 1125
Wire Wire Line
	6250 1125 6450 1125
Wire Wire Line
	6750 1325 6350 1325
Wire Wire Line
	6350 1325 6350 1825
Connection ~ 6350 1825
Wire Wire Line
	6350 1825 6175 1825
Wire Wire Line
	6750 2025 6750 2250
Wire Wire Line
	3125 6025 3575 6025
Wire Wire Line
	3125 6125 3575 6125
Wire Wire Line
	3125 6325 3575 6325
Wire Wire Line
	3125 5725 3575 5725
Text GLabel 8675 4175 2    50   Input ~ 0
TX_USB
Text GLabel 8675 4075 2    50   Input ~ 0
RX_USB
Wire Wire Line
	8100 4175 8675 4175
Wire Wire Line
	8000 4075 8675 4075
$Comp
L Connector:USB_B_Micro J1
U 1 1 5E0056A1
P 825 6025
F 0 "J1" H 900 6550 50  0000 C CNN
F 1 "USB_B_Micro" H 900 6450 50  0000 C CNN
F 2 "powerplay:microusb_PCB_socket" H 975 5975 50  0001 C CNN
F 3 "~" H 975 5975 50  0001 C CNN
	1    825  6025
	1    0    0    -1  
$EndComp
$Comp
L double-oh:CP2105 U6
U 1 1 5E009F27
P 2425 6125
F 0 "U6" H 2450 5000 50  0000 C CNN
F 1 "CP2105" H 2450 4900 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-24-1EP_4x4mm_P0.5mm_EP2.6x2.6mm" H 2575 5175 50  0001 L CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/cp2104.pdf" H 1875 7375 50  0001 C CNN
	1    2425 6125
	1    0    0    -1  
$EndComp
Wire Wire Line
	2525 7125 2475 7125
NoConn ~ 1125 6225
Wire Wire Line
	1125 6025 1725 6025
Wire Wire Line
	1725 5525 1725 5225
Wire Wire Line
	1125 6125 1725 6125
Text GLabel 1625 5225 0    50   Input ~ 0
3.3V
Wire Wire Line
	1625 5225 1725 5225
Connection ~ 1725 5225
$Comp
L Device:C_Small C8
U 1 1 5E037330
P 4225 5950
F 0 "C8" H 4350 5975 50  0000 C CNN
F 1 "0.1μF" H 4400 5900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4225 5950 50  0001 C CNN
F 3 "~" H 4225 5950 50  0001 C CNN
	1    4225 5950
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C9
U 1 1 5E037336
P 4225 6325
F 0 "C9" H 4350 6350 50  0000 C CNN
F 1 "2μF" H 4400 6275 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4225 6325 50  0001 C CNN
F 3 "~" H 4225 6325 50  0001 C CNN
	1    4225 6325
	0    1    1    0   
$EndComp
Wire Wire Line
	4175 6700 4125 6700
Wire Wire Line
	4350 5950 4325 5950
Wire Wire Line
	4350 5950 4350 6325
Wire Wire Line
	4350 6325 4325 6325
Connection ~ 4350 5950
Text GLabel 4350 5500 0    50   Input ~ 0
3.3V
Wire Wire Line
	4125 5950 4125 6325
Connection ~ 4125 6325
Wire Wire Line
	4125 6325 4125 6700
Wire Wire Line
	4350 5500 4350 5950
Text GLabel 4175 6700 2    50   Input ~ 0
0V
$Comp
L Device:R_Small_US R9
U 1 1 5E03CE80
P 1300 5825
F 0 "R9" V 1225 5825 50  0000 C CNN
F 1 "24kΩ" V 1150 5825 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1300 5825 50  0001 C CNN
F 3 "~" H 1300 5825 50  0001 C CNN
	1    1300 5825
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small_US R10
U 1 1 5E03EDAD
P 1475 5550
F 0 "R10" V 1400 5550 50  0000 C CNN
F 1 "47kΩ" V 1325 5550 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1475 5550 50  0001 C CNN
F 3 "~" H 1475 5550 50  0001 C CNN
	1    1475 5550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1125 5825 1150 5825
Wire Wire Line
	1400 5825 1475 5825
Wire Wire Line
	1475 5825 1475 5725
Wire Wire Line
	1475 5725 1725 5725
Connection ~ 1475 5725
Wire Wire Line
	1475 5725 1475 5650
Text GLabel 1350 5400 0    50   Input ~ 0
0V
Wire Wire Line
	1350 5400 1475 5400
Wire Wire Line
	1475 5400 1475 5450
Text GLabel 2225 7200 0    50   Input ~ 0
0V
Wire Wire Line
	2225 7200 2475 7200
Wire Wire Line
	2475 7200 2475 7125
Connection ~ 2475 7125
Wire Wire Line
	2475 7125 2425 7125
Text GLabel 825  6425 3    50   Input ~ 0
0V
NoConn ~ 725  6425
Text GLabel 1025 5325 0    50   Input ~ 0
USB_VIN
Wire Wire Line
	1025 5325 1150 5325
Wire Wire Line
	1150 5325 1150 5825
Connection ~ 1150 5825
Wire Wire Line
	1150 5825 1200 5825
Text GLabel 2625 2675 2    50   Input ~ 0
3.3V
$Comp
L Device:Antenna_Chip AE1
U 1 1 5E0A67E0
P 6375 4225
F 0 "AE1" H 6600 4400 50  0000 L CNN
F 1 "Antenna_Chip" H 6600 4300 50  0000 L CNN
F 2 "powerplay:AMCA31" H 6275 4400 50  0001 C CNN
F 3 "~" H 6275 4400 50  0001 C CNN
	1    6375 4225
	1    0    0    -1  
$EndComp
NoConn ~ 6475 4325
Wire Wire Line
	6275 4325 6275 4375
$Comp
L Device:C_Small C3
U 1 1 5D51B789
P 6175 4675
F 0 "C3" H 6300 4700 50  0000 C CNN
F 1 "1.5pF" H 6350 4625 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6175 4675 50  0001 C CNN
F 3 "~" H 6175 4675 50  0001 C CNN
	1    6175 4675
	0    -1   -1   0   
$EndComp
$Comp
L Device:L_Small L1
U 1 1 5E0AF63A
P 6275 4475
F 0 "L1" H 6350 4550 50  0000 L CNN
F 1 "3.9 nH" H 6350 4450 50  0000 L CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 6275 4475 50  0001 C CNN
F 3 "~" H 6275 4475 50  0001 C CNN
	1    6275 4475
	1    0    0    -1  
$EndComp
Wire Wire Line
	6275 4575 6275 4675
Wire Wire Line
	6275 4675 6275 4800
Connection ~ 6275 4675
Text GLabel 6000 4675 0    50   Input ~ 0
0V
Wire Wire Line
	6000 4675 6075 4675
Text Notes 6950 2050 0    50   ~ 0
ON Semi FFB2222A
Wire Wire Line
	6725 5400 6900 5400
Text GLabel 9450 1625 2    50   Input ~ 0
LIPO_ANODE
Text GLabel 9450 1500 2    50   Input ~ 0
LIPO_CATHODE
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 5E063625
P 9250 1625
F 0 "J6" H 9350 1625 50  0000 C CNN
F 1 "Conn_01x01" H 9125 1475 50  0001 C CNN
F 2 "powerplay:cap_board_solder_mount" H 9250 1625 50  0001 C CNN
F 3 "~" H 9250 1625 50  0001 C CNN
	1    9250 1625
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 5E063D72
P 9250 1500
F 0 "J5" H 9350 1500 50  0000 C CNN
F 1 "Conn_01x01" H 9125 1350 50  0001 C CNN
F 2 "powerplay:cap_board_solder_mount" H 9250 1500 50  0001 C CNN
F 3 "~" H 9250 1500 50  0001 C CNN
	1    9250 1500
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 5E074F51
P 9250 1075
F 0 "J3" H 9350 1075 50  0000 C CNN
F 1 "Conn_01x01" H 9125 925 50  0001 C CNN
F 2 "powerplay:main_board_solder_mount" H 9250 1075 50  0001 C CNN
F 3 "~" H 9250 1075 50  0001 C CNN
	1    9250 1075
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 5E074F5B
P 9250 1200
F 0 "J4" H 9350 1200 50  0000 C CNN
F 1 "Conn_01x01" H 9125 1050 50  0001 C CNN
F 2 "powerplay:main_board_solder_mount" H 9250 1200 50  0001 C CNN
F 3 "~" H 9250 1200 50  0001 C CNN
	1    9250 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3100 1375 3100 1300
Wire Wire Line
	3100 1675 3100 1750
Text GLabel 9450 1750 2    50   Input ~ 0
TOP_CAP
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 5E094155
P 9250 2050
F 0 "J8" H 9350 2050 50  0000 C CNN
F 1 "Conn_01x01" H 9125 1900 50  0001 C CNN
F 2 "powerplay:cap_contact" H 9250 2050 50  0001 C CNN
F 3 "~" H 9250 2050 50  0001 C CNN
	1    9250 2050
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 5E09415F
P 9250 1750
F 0 "J7" H 9350 1750 50  0000 C CNN
F 1 "Conn_01x01" H 9125 1600 50  0001 C CNN
F 2 "powerplay:cap_board_solder_mount" H 9250 1750 50  0001 C CNN
F 3 "~" H 9250 1750 50  0001 C CNN
	1    9250 1750
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 5E09C65E
P 9250 950
F 0 "J2" H 9350 950 50  0000 C CNN
F 1 "Conn_01x01" H 9125 800 50  0001 C CNN
F 2 "powerplay:main_board_solder_mount" H 9250 950 50  0001 C CNN
F 3 "~" H 9250 950 50  0001 C CNN
	1    9250 950 
	-1   0    0    1   
$EndComp
Text Notes 9125 875  0    50   ~ 0
Solder connections on main board:
Text Notes 9125 1425 0    50   ~ 0
Solder connections on cap boards:
Text GLabel 9450 1200 2    50   Input ~ 0
0V
Text GLabel 9450 1075 2    50   Input ~ 0
LIPO_V
Text GLabel 9450 950  2    50   Input ~ 0
to_top_cap
Text Notes 9125 1975 0    50   ~ 0
Contacts on cap boards:
Text GLabel 9450 2175 2    50   Input ~ 0
LIPO_ANODE
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 5E11106A
P 9250 2175
F 0 "J9" H 9350 2175 50  0000 C CNN
F 1 "Conn_01x01" H 9125 2025 50  0001 C CNN
F 2 "powerplay:lipo_contact" H 9250 2175 50  0001 C CNN
F 3 "~" H 9250 2175 50  0001 C CNN
	1    9250 2175
	-1   0    0    1   
$EndComp
Text GLabel 9450 2050 2    50   Input ~ 0
LIPO_ANODE
Text GLabel 9450 2425 2    50   Input ~ 0
TOP_CAP
Text GLabel 9450 2300 2    50   Input ~ 0
LIPO_CATHODE
$Comp
L Connector_Generic:Conn_01x01 J11
U 1 1 5E11873D
P 9250 2425
F 0 "J11" H 9350 2425 50  0000 C CNN
F 1 "Conn_01x01" H 9125 2275 50  0001 C CNN
F 2 "powerplay:cap_contact" H 9250 2425 50  0001 C CNN
F 3 "~" H 9250 2425 50  0001 C CNN
	1    9250 2425
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J10
U 1 1 5E118743
P 9250 2300
F 0 "J10" H 9350 2300 50  0000 C CNN
F 1 "Conn_01x01" H 9125 2150 50  0001 C CNN
F 2 "powerplay:lipo_contact" H 9250 2300 50  0001 C CNN
F 3 "~" H 9250 2300 50  0001 C CNN
	1    9250 2300
	-1   0    0    1   
$EndComp
Text Notes 1650 4075 0    50   ~ 0
Actually MCP4017T-503E
$Comp
L double-oh:MCP4017-xxxx U2
U 1 1 5E17759F
P 1675 4425
F 0 "U2" H 1700 5050 50  0000 C CNN
F 1 "MCP4017-xxxx" H 1700 4950 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 1725 4175 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22147a.pdf" H 1725 3875 50  0001 L CNN
	1    1675 4425
	1    0    0    -1  
$EndComp
Wire Wire Line
	9925 5400 9925 5625
Text GLabel 9925 4625 0    50   Input ~ 0
to_top_cap
Wire Wire Line
	9225 5200 9100 5200
$Comp
L Device:Q_PMOS_GSD Q1
U 1 1 5E0EBFFC
P 9825 5200
F 0 "Q1" H 10050 5275 50  0000 L CNN
F 1 "Q_PMOS_GSD" H 10050 5175 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 10025 5300 50  0001 C CNN
F 3 "~" H 9825 5200 50  0001 C CNN
	1    9825 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R4
U 1 1 5E0FEC54
P 9100 5050
F 0 "R4" V 9025 5100 50  0000 R CNN
F 1 "50kΩ" V 9175 5125 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 9100 5050 50  0001 C CNN
F 3 "~" H 9100 5050 50  0001 C CNN
	1    9100 5050
	-1   0    0    -1  
$EndComp
Text GLabel 9050 4900 0    50   Input ~ 0
3.3V
Wire Wire Line
	9050 4900 9100 4900
Wire Wire Line
	9100 4900 9100 4950
Wire Wire Line
	9425 5200 9625 5200
Wire Wire Line
	9100 5150 9100 5200
Connection ~ 9100 5200
Wire Wire Line
	9100 5200 8600 5200
Wire Wire Line
	1725 5225 2425 5225
Connection ~ 7600 4200
Text GLabel 1275 4425 0    50   Input ~ 0
i2c_scl
$Comp
L Device:R_Small_US R11
U 1 1 5E156774
P 7700 6000
F 0 "R11" V 7625 6050 50  0000 R CNN
F 1 "1GΩ" V 7775 6075 50  0000 R CNN
F 2 "Resistor_SMD:R_0201_0603Metric" H 7700 6000 50  0001 C CNN
F 3 "~" H 7700 6000 50  0001 C CNN
	1    7700 6000
	-1   0    0    -1  
$EndComp
Text Notes 7700 6375 0    50   ~ 0
DO NOT POPULATE THIS FOOTPRINT\nShorting the pads causes a factory reset
Wire Notes Line
	7875 6225 7875 6050
Wire Notes Line
	7875 6050 7800 6050
Wire Wire Line
	7600 5900 7600 6200
Wire Wire Line
	7700 6100 7800 6100
Wire Wire Line
	7800 6100 7800 5900
$EndSCHEMATC
