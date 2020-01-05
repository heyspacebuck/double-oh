# Double-Oh Battery

## Hardware version 1.0, Firmware version 0.0

This is the spiritual successor to the [SMOL](https://github.com/heyspacebuck/SMOL), a tiny PCB that interrupts battery output to make fun patterns. By designing around a 10mm-by-44mm LiPo cell, I've been able to add Wi-Fi connectivity, a USB connection for charging and programming, and a dangerous (but intriguing!) overvoltage mode.

The star of the show is the ESP8285, which is like the ESP8266 but has 1MB Flash memory built in. It handles the wireless networking and three GPIOs (for the digital potentiometer and MOSFET). If you know of a more suitable chip, tell me!

Hardware developed in KiCad 5.1; firmware developed in VSCode with the PlatformIO extension.

![](assembly.gif)

## To do:

* Lots of stuff on the firmware side
* Create BOM
* Clean up silkscreen
* Generate renders
* If it works, get OSHW certification!

## Future work

A "works-like" prototype is on its way to me now. It uses an ESP-WROOM-02 module and through-hole passive components. How well it works will dictate future plans.

I have a tentative design using the ESP32-PICO-D4, but I had to do some very sketchy routing where the thermal pad is supposed to be. I'd like to ask around before I try getting it fabbed.

One feature I'd really like to add is measuring instantaneous output current. I haven't looked into it yet, however.
