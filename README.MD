# Double-Oh Battery

## Hardware version 3.0, Firmware version 1.1

![](/img/banner.png)

This is the spiritual successor to the [SMOL](https://github.com/heyspacebuck/SMOL), a tiny PCB that interrupts battery output to make fun patterns. By designing around a 10mm-by-44mm LiPo cell, I've been able to add Wi-Fi connectivity, a USB connection for charging and programming, and a dangerous (but intriguing!) overvoltage mode.

The star of the show is the ESP32-U4WDH, a 5mm-by-5mm powerhouse. It handles the wireless networking and various GPIOs.

Hardware developed in KiCad 5.1; firmware built in the Arduino IDE. Licensed/Licenced with the [CERN OHL](https://www.ohwr.org/project/cernohl/wikis/home). Documentation covered by [Creative Commons Attribution (CC-BY) 4.0](https://creativecommons.org/licenses/by/4.0/).

![Small assembly animation](/img/assembly.gif)

## Assembly, setup, installation

Bill of materials is [here](bom.md). An interactive HTML BOM is [here](/hardware/bom/ibom.html). Assembly and initial setup is covered [here](setup.md).

## Schematic

![schematic](/img/schematic.png)

[A pdf version is also available.](/img/schematic.pdf)

## To do:

* Add pictures to [setup/assembly instructions](setup.md)
* Improve the user interface
* Generate renders

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
