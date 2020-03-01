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
L Battery_Management:MCP73831-2-OT U1
U 1 1 5CDCF91B
P 1900 1400
F 0 "U1" H 1900 1925 50  0000 C CNN
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
L Device:R_Small_US R2
U 1 1 5CDD2A78
P 1450 1625
F 0 "R2" H 1350 1550 50  0000 R CNN
F 1 "3kΩ" H 1350 1650 50  0000 R CNN
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
Text Notes 7175 2475 0    50   ~ 0
ESP32 2.4GHz SiP
Wire Wire Line
	2600 1750 3100 1750
Wire Wire Line
	2600 1300 3100 1300
Wire Wire Line
	10300 4275 10300 4650
Text GLabel 10300 5275 0    50   Input ~ 0
batt_out
Wire Wire Line
	3100 1100 3100 1300
Wire Wire Line
	3100 1875 3100 1750
$Comp
L Device:R_Small_US R8
U 1 1 5D570C7A
P 9700 4850
F 0 "R8" V 9625 4900 50  0000 R CNN
F 1 "1kΩ" V 9775 4925 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 9700 4850 50  0001 C CNN
F 3 "~" H 9700 4850 50  0001 C CNN
	1    9700 4850
	0    -1   1    0   
$EndComp
$Comp
L Device:Q_DUAL_NPN_NPN_E1B1C2E2B2C1 Q1
U 1 1 5DFF9476
P 4625 1225
F 0 "Q1" H 4825 1275 50  0000 L CNN
F 1 "Q_DUAL_NPN_NPN_E1B1C2E2B2C1" H 4825 1225 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 4825 1325 50  0001 C CNN
F 3 "~" H 4625 1225 50  0001 C CNN
	1    4625 1225
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_DUAL_NPN_NPN_E1B1C2E2B2C1 Q1
U 2 1 5DFF9AE1
P 4625 1925
F 0 "Q1" H 4825 1850 50  0000 L CNN
F 1 "Q_DUAL_NPN_NPN_E1B1C2E2B2C1" H 4825 1950 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 4825 2025 50  0001 C CNN
F 3 "~" H 4625 1925 50  0001 C CNN
	2    4625 1925
	1    0    0    1   
$EndComp
Text GLabel 3675 6300 2    50   Input ~ 0
TX_USB
Text GLabel 3675 6400 2    50   Input ~ 0
RX_USB
Text GLabel 3675 6600 2    50   Input ~ 0
RTS
Text GLabel 3675 6000 2    50   Input ~ 0
DTR
Text GLabel 4725 2350 3    50   Input ~ 0
GPIO0
Text GLabel 4725 725  1    50   Input ~ 0
EN
Text GLabel 4150 1925 0    50   Input ~ 0
RTS
Text GLabel 4150 1225 0    50   Input ~ 0
DTR
Wire Wire Line
	4150 1225 4325 1225
Wire Wire Line
	4425 1925 4325 1925
Wire Wire Line
	4725 1725 4325 1225
Connection ~ 4325 1225
Wire Wire Line
	4325 1225 4425 1225
Wire Wire Line
	4725 1425 4325 1925
Connection ~ 4325 1925
Wire Wire Line
	4325 1925 4150 1925
Wire Wire Line
	4725 2125 4725 2350
Wire Wire Line
	3225 6300 3600 6300
Wire Wire Line
	3225 6400 3600 6400
Wire Wire Line
	3225 6600 3675 6600
Wire Wire Line
	3225 6000 3675 6000
$Comp
L Connector:USB_B_Micro J1
U 1 1 5E0056A1
P 925 6300
F 0 "J1" H 1000 6825 50  0000 C CNN
F 1 "USB_B_Micro" H 1000 6725 50  0000 C CNN
F 2 "double-oh:microusb_PCB_socket" H 1075 6250 50  0001 C CNN
F 3 "~" H 1075 6250 50  0001 C CNN
	1    925  6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2625 7400 2575 7400
NoConn ~ 1225 6500
Wire Wire Line
	1825 5800 1825 5500
$Comp
L Device:C_Small C3
U 1 1 5E037330
P 4325 6225
F 0 "C3" H 4450 6250 50  0000 C CNN
F 1 "0.1μF" H 4500 6175 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4325 6225 50  0001 C CNN
F 3 "~" H 4325 6225 50  0001 C CNN
	1    4325 6225
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5E037336
P 4325 6600
F 0 "C4" H 4450 6625 50  0000 C CNN
F 1 "4.7μF" H 4500 6550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4325 6600 50  0001 C CNN
F 3 "~" H 4325 6600 50  0001 C CNN
	1    4325 6600
	0    1    1    0   
$EndComp
Wire Wire Line
	4275 6975 4225 6975
Wire Wire Line
	4450 6225 4425 6225
Wire Wire Line
	4450 6225 4450 6600
Wire Wire Line
	4450 6600 4425 6600
Connection ~ 4450 6225
Text GLabel 4450 5775 0    50   Input ~ 0
3.3V
Wire Wire Line
	4225 6225 4225 6600
Connection ~ 4225 6600
Wire Wire Line
	4225 6600 4225 6975
Wire Wire Line
	4450 5775 4450 6225
Text GLabel 4275 6975 2    50   Input ~ 0
0V
Wire Wire Line
	1225 6100 1250 6100
Wire Wire Line
	1575 6100 1575 6000
Wire Wire Line
	1575 6000 1825 6000
Text GLabel 2325 7475 0    50   Input ~ 0
0V
Wire Wire Line
	2325 7475 2575 7475
Wire Wire Line
	2575 7475 2575 7400
Connection ~ 2575 7400
Wire Wire Line
	2575 7400 2525 7400
Text GLabel 925  6700 3    50   Input ~ 0
0V
NoConn ~ 825  6700
Text GLabel 1125 5500 0    50   Input ~ 0
USB_VIN
Connection ~ 1250 6100
$Comp
L Device:Antenna_Chip AE1
U 1 1 5E0A67E0
P 8875 2575
F 0 "AE1" H 9100 2750 50  0000 L CNN
F 1 "Antenna_Chip" H 9100 2650 50  0000 L CNN
F 2 "double-oh:AMCA31" H 8775 2750 50  0001 C CNN
F 3 "~" H 8775 2750 50  0001 C CNN
	1    8875 2575
	-1   0    0    -1  
$EndComp
NoConn ~ 8775 2675
Wire Wire Line
	8975 2675 8975 2725
$Comp
L Device:C_Small C7
U 1 1 5D51B789
P 9075 3025
F 0 "C7" H 9200 3050 50  0000 C CNN
F 1 "1.5pF" H 9250 2975 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9075 3025 50  0001 C CNN
F 3 "~" H 9075 3025 50  0001 C CNN
	1    9075 3025
	0    1    -1   0   
$EndComp
$Comp
L Device:L_Small L1
U 1 1 5E0AF63A
P 8975 2825
F 0 "L1" H 9050 2900 50  0000 L CNN
F 1 "3.9nH" H 9050 2800 50  0000 L CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 8975 2825 50  0001 C CNN
F 3 "~" H 8975 2825 50  0001 C CNN
	1    8975 2825
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8975 2925 8975 3025
Wire Wire Line
	8975 3025 8975 3150
Connection ~ 8975 3025
Wire Wire Line
	9250 3025 9175 3025
Text Notes 4925 2150 0    50   ~ 0
ON Semi FFB2222A
Text GLabel 9900 1625 2    50   Input ~ 0
LIPO_ANODE
Text GLabel 9900 1500 2    50   Input ~ 0
LIPO_CATHODE
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 5E063625
P 9700 1625
F 0 "J6" H 9800 1625 50  0000 C CNN
F 1 "Conn_01x01" H 9575 1475 50  0001 C CNN
F 2 "double-oh:cap_board_solder_mount" H 9700 1625 50  0001 C CNN
F 3 "~" H 9700 1625 50  0001 C CNN
	1    9700 1625
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 5E063D72
P 9700 1500
F 0 "J5" H 9800 1500 50  0000 C CNN
F 1 "Conn_01x01" H 9575 1350 50  0001 C CNN
F 2 "double-oh:cap_board_solder_mount" H 9700 1500 50  0001 C CNN
F 3 "~" H 9700 1500 50  0001 C CNN
	1    9700 1500
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 5E074F51
P 9700 950
F 0 "J3" H 9800 950 50  0000 C CNN
F 1 "Conn_01x01" H 9575 800 50  0001 C CNN
F 2 "double-oh:main_board_solder_mount" H 9700 950 50  0001 C CNN
F 3 "~" H 9700 950 50  0001 C CNN
	1    9700 950 
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 5E074F5B
P 9700 1075
F 0 "J4" H 9800 1075 50  0000 C CNN
F 1 "Conn_01x01" H 9575 925 50  0001 C CNN
F 2 "double-oh:main_board_solder_mount" H 9700 1075 50  0001 C CNN
F 3 "~" H 9700 1075 50  0001 C CNN
	1    9700 1075
	-1   0    0    1   
$EndComp
Text GLabel 9900 1750 2    50   Input ~ 0
TOP_CAP
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 5E094155
P 9700 2175
F 0 "J8" H 9800 2175 50  0000 C CNN
F 1 "Conn_01x01" H 9575 2025 50  0001 C CNN
F 2 "double-oh:cap_contact" H 9700 2175 50  0001 C CNN
F 3 "~" H 9700 2175 50  0001 C CNN
	1    9700 2175
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 5E09415F
P 9700 1750
F 0 "J7" H 9800 1750 50  0000 C CNN
F 1 "Conn_01x01" H 9575 1600 50  0001 C CNN
F 2 "double-oh:cap_board_solder_mount" H 9700 1750 50  0001 C CNN
F 3 "~" H 9700 1750 50  0001 C CNN
	1    9700 1750
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 5E09C65E
P 9700 825
F 0 "J2" H 9800 825 50  0000 C CNN
F 1 "Conn_01x01" H 9575 675 50  0001 C CNN
F 2 "double-oh:main_board_solder_mount" H 9700 825 50  0001 C CNN
F 3 "~" H 9700 825 50  0001 C CNN
	1    9700 825 
	-1   0    0    1   
$EndComp
Text Notes 9575 750  0    50   ~ 0
Solder connections on main board:
Text Notes 9575 1425 0    50   ~ 0
Solder connections on cap boards:
Text GLabel 9900 1075 2    50   Input ~ 0
0V
Text GLabel 9900 950  2    50   Input ~ 0
LIPO_V
Text GLabel 9900 825  2    50   Input ~ 0
to_top_cap
Text Notes 9575 2100 0    50   ~ 0
Contacts on cap boards:
Text GLabel 9900 2300 2    50   Input ~ 0
LIPO_ANODE
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 5E11106A
P 9700 2300
F 0 "J9" H 9800 2300 50  0000 C CNN
F 1 "Conn_01x01" H 9575 2150 50  0001 C CNN
F 2 "double-oh:lipo_contact" H 9700 2300 50  0001 C CNN
F 3 "~" H 9700 2300 50  0001 C CNN
	1    9700 2300
	-1   0    0    1   
$EndComp
Text GLabel 9900 2175 2    50   Input ~ 0
LIPO_ANODE
Text GLabel 9900 2550 2    50   Input ~ 0
TOP_CAP
Text GLabel 9900 2425 2    50   Input ~ 0
LIPO_CATHODE
$Comp
L Connector_Generic:Conn_01x01 J11
U 1 1 5E11873D
P 9700 2550
F 0 "J11" H 9800 2550 50  0000 C CNN
F 1 "Conn_01x01" H 9575 2400 50  0001 C CNN
F 2 "double-oh:cap_contact" H 9700 2550 50  0001 C CNN
F 3 "~" H 9700 2550 50  0001 C CNN
	1    9700 2550
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J10
U 1 1 5E118743
P 9700 2425
F 0 "J10" H 9800 2425 50  0000 C CNN
F 1 "Conn_01x01" H 9575 2275 50  0001 C CNN
F 2 "double-oh:lipo_contact" H 9700 2425 50  0001 C CNN
F 3 "~" H 9700 2425 50  0001 C CNN
	1    9700 2425
	-1   0    0    1   
$EndComp
Wire Wire Line
	10300 5050 10300 5275
Text GLabel 10300 4275 0    50   Input ~ 0
to_top_cap
Wire Wire Line
	9600 4850 9475 4850
$Comp
L Device:Q_PMOS_GSD Q2
U 1 1 5E0EBFFC
P 10200 4850
F 0 "Q2" H 10425 4925 50  0000 L CNN
F 1 "Q_PMOS_GSD" H 10425 4825 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70" H 10400 4950 50  0001 C CNN
F 3 "~" H 10200 4850 50  0001 C CNN
	1    10200 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R7
U 1 1 5E0FEC54
P 9475 4700
F 0 "R7" V 9400 4750 50  0000 R CNN
F 1 "68kΩ" V 9550 4775 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 9475 4700 50  0001 C CNN
F 3 "~" H 9475 4700 50  0001 C CNN
	1    9475 4700
	-1   0    0    -1  
$EndComp
Text GLabel 9425 4550 0    50   Input ~ 0
3.3V
Wire Wire Line
	9425 4550 9475 4550
Wire Wire Line
	9475 4550 9475 4600
Wire Wire Line
	9800 4850 10000 4850
Wire Wire Line
	9475 4800 9475 4850
Connection ~ 9475 4850
Wire Wire Line
	9475 4850 8975 4850
Text Notes 7050 5000 1    50   ~ 0
DO NOT POPULATE THIS FOOTPRINT\nShorting the pads causes a factory reset
Wire Notes Line
	7100 4225 7175 4225
$Comp
L Device:R_Small_US R9
U 1 1 5E1E25CE
P 3350 3625
F 0 "R9" V 3275 3625 50  0000 C CNN
F 1 "480kΩ" V 3425 3625 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3350 3625 50  0001 C CNN
F 3 "~" H 3350 3625 50  0001 C CNN
	1    3350 3625
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small_US R10
U 1 1 5E1E38B8
P 3600 3625
F 0 "R10" V 3675 3625 50  0000 C CNN
F 1 "120kΩ" V 3525 3625 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3600 3625 50  0001 C CNN
F 3 "~" H 3600 3625 50  0001 C CNN
	1    3600 3625
	0    1    -1   0   
$EndComp
$Comp
L Device:L_Small L2
U 1 1 5E1EF938
P 3100 3725
F 0 "L2" V 3150 3675 50  0000 L CNN
F 1 "2.2μH" V 3050 3600 50  0000 L CNN
F 2 "Inductor_SMD:L_0805_2012Metric" H 3100 3725 50  0001 C CNN
F 3 "~" H 3100 3725 50  0001 C CNN
	1    3100 3725
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R11
U 1 1 5E20F539
P 3525 4125
F 0 "R11" H 3400 4150 50  0000 C CNN
F 1 "324kΩ" H 3350 4075 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3525 4125 50  0001 C CNN
F 3 "~" H 3525 4125 50  0001 C CNN
	1    3525 4125
	-1   0    0    -1  
$EndComp
$Comp
L Device:L_Small L3
U 1 1 5E223740
P 3100 4025
F 0 "L3" V 3250 4000 50  0000 L CNN
F 1 "2.2μH" V 3175 3900 50  0000 L CNN
F 2 "Inductor_SMD:L_0805_2012Metric" H 3100 4025 50  0001 C CNN
F 3 "~" H 3100 4025 50  0001 C CNN
	1    3100 4025
	0    -1   -1   0   
$EndComp
Text GLabel 4050 3375 2    50   Output ~ 0
3.3V
Text GLabel 4050 4025 2    50   Output ~ 0
batt_out
$Comp
L Device:C_Small C11
U 1 1 5E24C7B6
P 1850 4100
F 0 "C11" H 1750 4025 50  0000 R CNN
F 1 "10μF" H 1750 4125 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1850 4100 50  0001 C CNN
F 3 "~" H 1850 4100 50  0001 C CNN
	1    1850 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5E24CE21
P 3300 4125
F 0 "C12" H 3200 4050 50  0000 R CNN
F 1 "33pF" H 3200 4150 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3300 4125 50  0001 C CNN
F 3 "~" H 3300 4125 50  0001 C CNN
	1    3300 4125
	1    0    0    -1  
$EndComp
Text GLabel 1675 2800 0    50   Input ~ 0
LIPO_V
Wire Wire Line
	1850 3300 1850 3625
Text GLabel 975  4450 0    50   Input ~ 0
0V
$Comp
L Device:C_Small C10
U 1 1 5E287200
P 4000 3625
F 0 "C10" H 3900 3550 50  0000 R CNN
F 1 "10μF" H 3900 3650 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4000 3625 50  0001 C CNN
F 3 "~" H 4000 3625 50  0001 C CNN
	1    4000 3625
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5E29EA4A
P 4000 4225
F 0 "C13" H 3900 4150 50  0000 R CNN
F 1 "10μF" H 3900 4250 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4000 4225 50  0001 C CNN
F 3 "~" H 4000 4225 50  0001 C CNN
	1    4000 4225
	-1   0    0    1   
$EndComp
Text Notes 1750 4675 0    50   ~ 0
3.3VDC fixed power supply\n1.2-3.3VDC variable power supply
Text Notes 1975 5375 0    50   ~ 0
CP2104 USB-to-UART bridge\n
Text GLabel 8575 875  0    50   Input ~ 0
to_top_cap
Text GLabel 8575 1175 0    50   Input ~ 0
0V
$Comp
L Device:D_ALT D2
U 1 1 5E31A252
P 8750 1025
F 0 "D2" V 8800 900 50  0000 R CNN
F 1 "D_ALT" V 8750 900 50  0000 R CNN
F 2 "Diode_SMD:D_0402_1005Metric" H 8750 1025 50  0001 C CNN
F 3 "~" H 8750 1025 50  0001 C CNN
	1    8750 1025
	0    1    1    0   
$EndComp
Wire Wire Line
	8575 1175 8750 1175
Wire Wire Line
	8750 875  8575 875 
Text Notes 8375 750  0    50   ~ 0
Flyback diode
$Comp
L Connector_Generic:Conn_01x01 J12
U 1 1 5E3380EF
P 9700 1200
F 0 "J12" H 9800 1200 50  0000 C CNN
F 1 "Conn_01x01" H 9575 1050 50  0001 C CNN
F 2 "double-oh:main_board_solder_mount" H 9700 1200 50  0001 C CNN
F 3 "~" H 9700 1200 50  0001 C CNN
	1    9700 1200
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J13
U 1 1 5E34DCF2
P 9700 1875
F 0 "J13" H 9800 1875 50  0000 C CNN
F 1 "Conn_01x01" H 9575 1725 50  0001 C CNN
F 2 "double-oh:cap_board_solder_mount" H 9700 1875 50  0001 C CNN
F 3 "~" H 9700 1875 50  0001 C CNN
	1    9700 1875
	-1   0    0    1   
$EndComp
NoConn ~ 9900 1200
NoConn ~ 9900 1875
$Comp
L Device:R_Small_US R13
U 1 1 5E2690F2
P 4950 975
F 0 "R13" V 4875 1025 50  0000 R CNN
F 1 "68kΩ" V 5025 1050 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4950 975 50  0001 C CNN
F 3 "~" H 4950 975 50  0001 C CNN
	1    4950 975 
	0    1    -1   0   
$EndComp
Text GLabel 5200 900  1    50   Input ~ 0
3.3V
Wire Wire Line
	5200 900  5200 975 
Wire Wire Line
	5200 975  5050 975 
Wire Wire Line
	4850 975  4725 975 
Connection ~ 4725 975 
Wire Wire Line
	4725 975  4725 1025
$Comp
L Interface_USB:CP2104 U2
U 1 1 5E1C43B6
P 2525 6400
F 0 "U2" H 2525 5275 50  0000 C CNN
F 1 "CP2104" H 2525 5175 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-24-1EP_4x4mm_P0.5mm_EP2.6x2.6mm" H 2675 5450 50  0001 L CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/cp2104.pdf" H 1975 7650 50  0001 C CNN
	1    2525 6400
	1    0    0    -1  
$EndComp
Text GLabel 3675 6200 2    50   Input ~ 0
RX_ESP
Wire Wire Line
	3675 6200 3600 6200
Wire Wire Line
	3600 6200 3600 6300
Connection ~ 3600 6300
Wire Wire Line
	3600 6300 3675 6300
Text GLabel 3675 6500 2    50   Input ~ 0
TX_ESP
Wire Wire Line
	3675 6500 3600 6500
Wire Wire Line
	3600 6500 3600 6400
Connection ~ 3600 6400
Wire Wire Line
	3600 6400 3675 6400
$Comp
L Device:R_Small_US R4
U 1 1 5CDD7328
P 2200 1050
F 0 "R4" V 1975 1050 50  0000 C CNN
F 1 "2kΩ" V 2075 1050 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 2200 1050 50  0001 C CNN
F 3 "~" H 2200 1050 50  0001 C CNN
	1    2200 1050
	0    -1   1    0   
$EndComp
$Comp
L RF_Module:ESP32-PICO-D4 U4
U 1 1 5E2037A4
P 8175 4550
F 0 "U4" H 8300 2825 50  0000 C CNN
F 1 "ESP32-PICO-D4" H 8175 2725 50  0000 C CNN
F 2 "double-oh:QFN-48-1EP_7x7mm_P0.5mm_EP3.6x3.6mm" H 8175 2850 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-pico-d4_datasheet_en.pdf" H 8425 3550 50  0001 C CNN
	1    8175 4550
	1    0    0    -1  
$EndComp
Text GLabel 7225 3150 0    50   Input ~ 0
EN
Wire Wire Line
	7225 3150 7375 3150
Wire Wire Line
	8275 2950 8175 2950
Wire Wire Line
	8175 2950 8075 2950
Connection ~ 8175 2950
Wire Wire Line
	8075 2950 7975 2950
Connection ~ 8075 2950
Wire Wire Line
	7975 2950 7975 2725
Connection ~ 7975 2950
Text GLabel 7975 2725 0    50   Input ~ 0
3.3V
Text GLabel 9250 3025 2    50   Input ~ 0
0V
Text GLabel 8975 3450 2    50   Input ~ 0
TX_ESP
Text GLabel 8975 3650 2    50   Input ~ 0
RX_ESP
NoConn ~ 8975 3550
Text GLabel 8975 3350 2    50   Input ~ 0
GPIO0
$Comp
L Device:R_Small_US R5
U 1 1 5E2CCDF2
P 7325 4225
F 0 "R5" V 7250 4275 50  0000 R CNN
F 1 "1GΩ" V 7400 4300 50  0000 R CNN
F 2 "Resistor_SMD:R_0201_0603Metric" H 7325 4225 50  0001 C CNN
F 3 "~" H 7325 4225 50  0001 C CNN
	1    7325 4225
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7375 4550 7325 4550
Wire Wire Line
	7325 4550 7325 4325
Text GLabel 7325 4050 1    50   Input ~ 0
GPIO4
Wire Wire Line
	7325 4050 7325 4125
Text GLabel 8975 3750 2    50   Input ~ 0
GPIO4
Text GLabel 8975 5350 2    50   Input ~ 0
EN
Text GLabel 8975 5850 2    50   Input ~ 0
3.3V
Text GLabel 8175 6150 3    50   Input ~ 0
0V
Wire Notes Line
	7100 3450 7100 5000
Wire Wire Line
	1225 6300 1425 6300
Wire Wire Line
	1425 6300 1475 6400
Wire Wire Line
	1475 6400 1825 6400
Wire Wire Line
	1425 6400 1475 6300
Wire Wire Line
	4725 725  4725 975 
$Comp
L Device:C_Small C5
U 1 1 5E1EA531
P 4525 975
F 0 "C5" V 4625 1025 50  0000 R CNN
F 1 "0.1μF" V 4400 1075 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4525 975 50  0001 C CNN
F 3 "~" H 4525 975 50  0001 C CNN
	1    4525 975 
	0    1    1    0   
$EndComp
Text GLabel 4300 900  1    50   Input ~ 0
0V
Wire Wire Line
	4300 900  4300 975 
Wire Wire Line
	4300 975  4425 975 
Wire Wire Line
	4625 975  4725 975 
$Comp
L Device:R_Small_US R6
U 1 1 5E2A3E0B
P 3525 4350
F 0 "R6" H 3425 4325 50  0000 C CNN
F 1 "68kΩ" H 3375 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3525 4350 50  0001 C CNN
F 3 "~" H 3525 4350 50  0001 C CNN
	1    3525 4350
	-1   0    0    -1  
$EndComp
Text GLabel 9400 5050 2    50   Input ~ 0
DAC
$Comp
L Device:R_Small_US R12
U 1 1 5E2FE184
P 9175 5050
F 0 "R12" V 9325 5050 50  0000 C CNN
F 1 "348kΩ" V 9250 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 9175 5050 50  0001 C CNN
F 3 "~" H 9175 5050 50  0001 C CNN
	1    9175 5050
	0    1    -1   0   
$EndComp
Wire Wire Line
	9075 5050 8975 5050
Wire Wire Line
	9275 5050 9400 5050
Wire Wire Line
	1225 6400 1425 6400
Wire Wire Line
	1475 6300 1825 6300
Wire Wire Line
	1250 5500 1125 5500
Wire Wire Line
	1250 5500 1250 6100
Wire Wire Line
	1250 5500 1825 5500
Connection ~ 1250 5500
Wire Wire Line
	2325 5500 2325 5425
Wire Wire Line
	2325 5425 2525 5425
Wire Wire Line
	2525 5425 2525 5500
$Comp
L Device:R_Small_US R1
U 1 1 5E03CE80
P 7225 1300
F 0 "R1" V 7150 1300 50  0000 C CNN
F 1 "68kΩ" V 7075 1300 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 7225 1300 50  0001 C CNN
F 3 "~" H 7225 1300 50  0001 C CNN
	1    7225 1300
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R3
U 1 1 5E03EDAD
P 7225 1650
F 0 "R3" H 7150 1650 50  0000 C CNN
F 1 "68kΩ" V 7075 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 7225 1650 50  0001 C CNN
F 3 "~" H 7225 1650 50  0001 C CNN
	1    7225 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1250 6100 1575 6100
Text GLabel 7225 1050 1    50   Input ~ 0
LIPO_V
Wire Wire Line
	7225 1050 7225 1200
Wire Wire Line
	7225 1400 7225 1500
Text GLabel 7225 1875 3    50   Input ~ 0
0V
Wire Wire Line
	7225 1875 7225 1750
Wire Wire Line
	7225 1500 7575 1500
Connection ~ 7225 1500
Wire Wire Line
	7225 1500 7225 1550
Text GLabel 7575 1500 2    50   Input ~ 0
GPIO26
Text GLabel 9400 5150 2    50   Input ~ 0
GPIO26
$Comp
L Device:Q_PMOS_GSD Q3
U 1 1 5E32DC15
P 1750 3100
F 0 "Q3" H 1955 3146 50  0000 L CNN
F 1 "Q_PMOS_GSD" H 1955 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70" H 1950 3200 50  0001 C CNN
F 3 "~" H 1750 3100 50  0001 C CNN
	1    1750 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D3
U 1 1 5E32F864
P 1700 3300
F 0 "D3" H 1700 3084 50  0000 C CNN
F 1 "D_Schottky" H 1700 3175 50  0000 C CNN
F 2 "Diode_SMD:D_0402_1005Metric" H 1700 3300 50  0001 C CNN
F 3 "~" H 1700 3300 50  0001 C CNN
	1    1700 3300
	-1   0    0    1   
$EndComp
Connection ~ 1850 3300
Wire Wire Line
	1675 2800 1850 2800
Wire Wire Line
	1850 2800 1850 2900
Wire Wire Line
	1550 3300 1475 3300
Wire Wire Line
	1475 3300 1475 3100
Wire Wire Line
	1475 3100 1550 3100
Wire Wire Line
	975  4450 1175 4450
$Comp
L Device:R_Small_US R14
U 1 1 5E363F6E
P 1175 3400
F 0 "R14" V 1025 3400 50  0000 C CNN
F 1 "68kΩ" V 1100 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1175 3400 50  0001 C CNN
F 3 "~" H 1175 3400 50  0001 C CNN
	1    1175 3400
	1    0    0    1   
$EndComp
Wire Wire Line
	1175 3300 1175 3100
Wire Wire Line
	1175 3100 1475 3100
Connection ~ 1475 3100
Text GLabel 975  3100 0    50   Input ~ 0
USB_VIN
Wire Wire Line
	975  3100 1175 3100
Connection ~ 1175 3100
Wire Wire Line
	9400 5150 8975 5150
$Comp
L double-oh:TPS62400 U3
U 1 1 5E5D3B1B
P 2400 3925
F 0 "U3" H 2425 4550 50  0000 C CNN
F 1 "TPS62400" H 2425 4450 50  0000 C CNN
F 2 "Package_SON:VSON-10-1EP_3x3mm_P0.5mm_EP1.65x2.4mm" H 2400 3925 50  0001 C CNN
F 3 "" H 2400 3925 50  0001 C CNN
	1    2400 3925
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4450 1850 4225
Wire Wire Line
	1850 4450 2675 4450
Wire Wire Line
	2950 4450 2950 4225
Connection ~ 1850 4450
Wire Wire Line
	1175 3500 1175 4450
Wire Wire Line
	1175 4450 1850 4450
Wire Wire Line
	1850 3975 1850 3875
Wire Wire Line
	1850 3875 1850 3625
Connection ~ 1850 3875
Connection ~ 1850 3625
Wire Wire Line
	1850 4200 1850 4225
Connection ~ 1850 4225
Wire Wire Line
	1850 4000 1850 3975
Connection ~ 1850 3975
Connection ~ 1175 4450
Wire Wire Line
	3000 3725 2950 3725
Wire Wire Line
	3200 3725 3200 3625
Wire Wire Line
	3200 3625 2950 3625
Wire Wire Line
	3250 3625 3200 3625
Connection ~ 3200 3625
Wire Wire Line
	3475 3625 3475 3825
Wire Wire Line
	3500 3625 3475 3625
Connection ~ 3475 3625
Wire Wire Line
	3475 3625 3450 3625
Wire Wire Line
	2950 3825 3475 3825
Wire Wire Line
	4000 3825 4000 3725
Wire Wire Line
	4000 3525 4000 3375
Wire Wire Line
	3200 3375 3200 3625
Wire Wire Line
	3700 3625 3725 3625
Wire Wire Line
	3725 3625 3725 3825
Text GLabel 4050 3825 2    50   Input ~ 0
0V
Wire Wire Line
	3000 4025 2950 4025
Wire Wire Line
	4050 4025 4000 4025
Connection ~ 4000 3375
Wire Wire Line
	4000 3375 4050 3375
Connection ~ 4000 3825
Wire Wire Line
	4000 3825 4050 3825
Wire Wire Line
	3200 3375 4000 3375
Wire Wire Line
	3725 3825 4000 3825
Wire Wire Line
	4000 4125 4000 4025
Connection ~ 4000 4025
Wire Wire Line
	4000 4325 4000 4450
Connection ~ 2950 4450
Connection ~ 3300 4025
Wire Wire Line
	3300 4025 3200 4025
Wire Wire Line
	2950 4125 3025 4125
Wire Wire Line
	3025 4125 3025 4250
Wire Wire Line
	3025 4250 3300 4250
Wire Wire Line
	3300 4250 3300 4225
Wire Wire Line
	3525 4250 3525 4225
Wire Wire Line
	3525 4250 3275 4350
Text GLabel 3275 4350 0    50   Input ~ 0
DAC
Connection ~ 3525 4250
Wire Wire Line
	3300 4250 3525 4250
Connection ~ 3525 4025
Wire Wire Line
	3525 4025 4000 4025
Connection ~ 3525 4450
Wire Wire Line
	3525 4450 4000 4450
Wire Wire Line
	3300 4025 3525 4025
Wire Wire Line
	2950 4450 3525 4450
Connection ~ 3300 4250
Wire Wire Line
	2600 4525 2675 4525
Wire Wire Line
	2675 4525 2675 4450
Connection ~ 2675 4450
Wire Wire Line
	2675 4450 2950 4450
$EndSCHEMATC
