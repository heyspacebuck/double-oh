# Double-Oh Battery

## Hardware version 2.7, Firmware version 0.7

![](banner.png)

This is the spiritual successor to the [SMOL](https://github.com/heyspacebuck/SMOL), a tiny PCB that interrupts battery output to make fun patterns. By designing around a 10mm-by-44mm LiPo cell, I've been able to add Wi-Fi connectivity, a USB connection for charging and programming, and a dangerous (but intriguing!) overvoltage mode.

The star of the show is the ESP32-PICO-32, a 7mm-by-7mm powerhouse. It handles the wireless networking and various GPIOs.

Hardware developed in KiCad 5.1; firmware built in the Arduino IDE. Licensed/Licenced with the [CERN OHL](https://www.ohwr.org/project/cernohl/wikis/home). Documentation covered by [Creative Commons Attribution (CC-BY) 4.0](https://creativecommons.org/licenses/by/4.0/).

![](assembly.gif)

## Assembly, setup, installation

Bill of materials is [here](bom.md). An interactive HTML BOM is [here](/hardware/bom/ibom.html). Assembly and initial setup is covered [here](setup.md).

## To do:

* Add pictures to [setup/assembly instructions](setup.md)
* Improve the user interface
* Generate renders
* Get OSHW certification!

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
