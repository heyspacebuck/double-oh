# Bill of Materials
## Valid as of Hardware version 2.6

|      |References              |Value                       |Footprint           |Quantity|Notes                              |
|------|------------------------|----------------------------|--------------------|--------|-----------------------------------|
|1     |C1, C2                  |4.7μF                       |0402 (1005 Metric)  |2       |                                   |
|2     |C5                      |0.1μF                       |0402 (1005 Metric)  |1       |                                   |
|3     |C7                      |1.5pF                       |0402 (1005 Metric)  |1       |                                   |
|4     |C10, C11, C13           |10μF                        |0402 (1005 Metric)  |3       |                                   |
|5     |C12                     |33pF                        |0402 (1005 Metric)  |1       |                                   |
|6     |R1, R3, R6, R7, R13, R14|68kΩ                        |0402 (1005 Metric)  |6       |                                   |
|7     |R2                      |3kΩ                         |0402 (1005 Metric)  |1       |                                   |
|8     |R4                      |2kΩ                         |0402 (1005 Metric)  |1       |                                   |
|9     |R5, R9                  |470kΩ                       |0402 (1005 Metric)  |1       |                                   |
|10    |R8                      |1kΩ                         |0402 (1005 Metric)  |1       |                                   |
|11    |R10                     |120kΩ                       |0402 (1005 Metric)  |1       |                                   |
|12    |R11                     |330kΩ                       |0402 (1005 Metric)  |1       |                                   |
|13    |R12                     |300kΩ                       |0402 (1005 Metric)  |1       |                                   |
|14    |L1                      |3.9nH                       |0603 (1608 Metric)  |1       |                                   |
|15    |L2, L3                  |2.2μH                       |0805 (2012 Metric)  |2       |Should be rated for at least 800 mA|
|16    |D1                      |LED Blue                    |0402 (1005 Metric)  |1       |                                   |
|17    |D2, D3                  |Schottky Diode              |0402 (1005 Metric)  |2       |                                   |
|18    |U1                      |MCP73831-2-OT               |SOT-23-5            |1       |USB Li-ion charging controller     |
|19    |U2                      |CP2104                      |QFN-24 4x4mm P0.5mm |1       |USB-to-UART bridge                 |
|20    |U3                      |TPS62400                    |VSON-10 3x3mm P0.5mm|1       |Dual-output voltage regulator      |
|21    |U4                      |ESP32-PICO-D4               |QFN-48 7x7mm P0.5mm |1       |The brains of the operation        |
|22    |U5                      |BD48K34G                    |SOT-23              |1       |Low-battery power supervisor; on back of board  |
|23    |AE1                     |AMCA31 Chip Antenna         |1206 (3216 Metric)  |1       |                                   |
|24    |Q1                      |BC847BS Dual NPN Transistors|SOT-363 (SC-88)     |1       |                                   |
|25    |Q2, Q4                  |NTS4101P P-Channel MOSFET   |SOT-323 (SC-70)     |2       |                                   |
