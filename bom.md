# Bill of Materials
## Valid as of Hardware version 3.0

See also: [interactive HTML BOM](/hardware/bom/ibom.html)

|      |References              |Value          |Footprint           |Quantity|Notes                              |
|------|------------------------|---------------|--------------------|--------|-----------------------------------|
|1     |C1, C2, C3              |4.7μF          |0402 (1005 Metric)  |2       |                                   |
|2     |C4, C5, C6              |10μF           |0402 (1005 Metric)  |3       |                                   |
|3     |C7                      |33pF           |0402 (1005 Metric)  |1       |                                   |
|4     |C8                      |1.5pF          |0402 (1005 Metric)  |1       |                                   |
|5     |R1, R3, R6, R7, R13, R14|68kΩ           |0402 (1005 Metric)  |6       |                                   |
|6     |R2                      |3kΩ            |0402 (1005 Metric)  |1       |                                   |
|7     |R4                      |2kΩ            |0402 (1005 Metric)  |1       |                                   |
|8     |R5, R9                  |470kΩ          |0402 (1005 Metric)  |1       |                                   |
|9     |R8                      |1kΩ            |0402 (1005 Metric)  |1       |                                   |
|10    |R10                     |120kΩ          |0402 (1005 Metric)  |1       |                                   |
|11    |R11                     |330kΩ          |0402 (1005 Metric)  |1       |                                   |
|12    |R12                     |300kΩ          |0402 (1005 Metric)  |1       |                                   |
|13    |L1                      |3.9nH          |0603 (1608 Metric)  |1       |                                   |
|14    |L2, L3                  |2.2μH          |0806 (2016 Metric)  |2       |Should be rated for at least 800 mA|
|15    |D1                      |LED Blue       |0402 (1005 Metric)  |1       |                                   |
|16    |D2, D3                  |Schottky Diode |0402 (1005 Metric)  |2       |                                   |
|17    |U1                      |MCP73831-2-OT  |SOT-23-5            |1       |USB Li-ion charging controller     |
|18    |U2                      |CP2104         |QFN-24 4x4mm P0.5mm |1       |USB-to-UART bridge                 |
|19    |U3                      |TPS62400       |VSON-10 3x3mm P0.5mm|1       |Dual-output voltage regulator      |
|20    |U4                      |ESP32-PICO-D4  |QFN-48 7x7mm P0.5mm |1       |The brains of the operation        |
|21    |U5                      |BD48K34G       |SOT-23              |1       |Low-battery power supervisor; on back of board  |
|22    |AE1                     |AMCA31         |1206 (3216 Metric)  |1       |2.4 GHz chip antenna               |
|23    |Q1                      |BC847BS        |SOT-363 (SC-88)     |1       |Dual NPN transistors               |
|24    |Q2, Q3                  |NTS4101P       |SOT-323 (SC-70)     |2       |P-Channel MOSFET                   |
