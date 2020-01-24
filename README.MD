# Double-Oh Battery

## Hardware version 2.1, Firmware version 0.5

![](banner.png)

This is the spiritual successor to the [SMOL](https://github.com/heyspacebuck/SMOL), a tiny PCB that interrupts battery output to make fun patterns. By designing around a 10mm-by-44mm LiPo cell, I've been able to add Wi-Fi connectivity, a USB connection for charging and programming, and a dangerous (but intriguing!) overvoltage mode.

The star of the show is the ESP32-PICO-32, a 7mm-by-7mm powerhouse. It handles the wireless networking and various GPIOs.

Hardware developed in KiCad 5.1; firmware developed in VSCode with the PlatformIO extension.

![](assembly.gif)

## To do:

* Lots of stuff on the firmware side
* Create BOM
* Clean up silkscreen
* Generate renders
* If it works, get OSHW certification!

## Future work

One feature I'd really like to add is measuring instantaneous output current. I haven't looked into it yet, however.
