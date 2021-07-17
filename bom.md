# Bill of Materials
## Valid as of Hardware version 3.0

See also: [interactive HTML BOM](/hardware/bom/ibom.html)

|      |References              |Value          |Footprint           |Quantity|Notes                              |
|------|------------------------|---------------|--------------------|--------|-----------------------------------|
|1     |C1, C2, C3, C4, C7      |4.7μF          |0402 (1005 Metric)  |5       |                                   |
|2     |C5, C9                  |10μF           |0402 (1005 Metric)  |2       |                                   |
|3     |C6                      |120pF          |0402 (1005 Metric)  |1       |                                   |
|4     |C8                      |1.5pF          |0402 (1005 Metric)  |1       |                                   |
|5     |R1, R3, R5, R6, R7, R10, R11, R13|68kΩ  |0402 (1005 Metric)  |8       |                                   |
|6     |R2                      |3kΩ            |0402 (1005 Metric)  |1       |                                   |
|7     |R4                      |2kΩ            |0402 (1005 Metric)  |1       |Increase this value to dim the LED |
|8     |R8                      |1kΩ m           |0402 (1005 Metric)  |1       |                                   |
|9     |R9                      |330kΩ          |0402 (1005 Metric)  |1       |                                   |
|10    |R12                     |300kΩ          |0402 (1005 Metric)  |1       |                                   |
|11    |R14                     |24kΩ or 0kΩ    |0402 (1005 Metric)  |1       |If using CP2102N, use 24 kΩ; if using CP2104, short R14|
|12    |R15                     |47kΩ or nothing|0402 (1005 Metric)  |1       |If using CP2102N, use 24 kΩ; if using CP2104, do not populate|
|13    |R16                     |Nothing or 68kΩ|0402 (1005 Metric)  |1       |This should only be populated if U6 is omitted, or if using the N-channel open drain version of U6|
|14    |L1                      |3.9nH          |0603 (1608 Metric)  |1       |                                   |
|15    |D1                      |Blue LED       |0402 (1005 Metric)  |1       |                                   |
|16    |D2, D3                  |Schottky Diode |0402 (1005 Metric)  |2       |Should be rated for at least 350 mA continuous discharge|
|17    |U1                      |ESP32-U4WDH    |QFN-48 5x5mm P0.35mm|1       |[Datasheet](https://www.espressif.com/sites/default/files/documentation/esp32_datasheet_en.pdf)|
|18    |U2                      |CP2102N        |QFN-24 4x4mm P0.5mm |1       |[Datasheet](https://www.silabs.com/documents/public/data-sheets/cp2102n-datasheet.pdf) -- Can use the [CP2104](https://www.silabs.com/documents/public/data-sheets/cp2104.pdf) instead, see notes on R14 and R15 |
|19    |U3                      |TPSM828214SILR |μSiL-10 2x2.5mm     |1       |[Datasheet](https://www.ti.com/lit/ds/symlink/tpsm82821.pdf) -- this one is 3.3V fixed output|
|20    |U4                      |TPSM82821SILR  |μSiL-10 2x2.5mm     |1       |[Datasheet](https://www.ti.com/lit/ds/symlink/tpsm82821.pdf) -- this one is adjustable output|
|21    |U5                      |MCP73831-2-OT  |SOT-23-5            |1       |[Datasheet](http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf)|
|22    |U6                      |XC6120C322HR-G |USP-3               |1       |[Datasheet](https://www.torexsemi.com/file/xc6120/XC6120.pdf) -- Not *strictly* necessary but good to have. This supervisor comes in both CMOS and N-channel open drain varieties; if using the CMOS, do not populate R16. |
|23    |AE1                     |AMCA31         |1206 (3216 Metric)  |1       |2.4 GHz chip antenna               |
|24    |Q1                      |MUN5213DW1     |SOT-363 (SC-88)     |1       |Dual NPN transistors, pre-biased   |
|25    |Q2, Q3                  |NTS4101P       |SOT-323 (SC-70)     |2       |P-Channel MOSFET                   |