# Double-Oh Battery Assembly and Setup

## Hardware version 2.6, Firmware version 0.6

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

## Top side assembly

Parts used:
- 36 SMD components (see the [BOM](bom.md))
- Main PCB

All but one of the Double-Oh components are placed on the top side of the PCB. When this side is assembled, we can run the device off USB power and install the Double-Oh firmware. The [interactive BOM](/hardware/bom/ibom.html) makes placing the components a lot easier.

## Firmware installation

Tools used:
- Micro-USB cable
- Arduino IDE
- Multimeter (optional)

Now that the top side of the PCB is assembled, the Double-Oh firmware can be installed. Plug in the micro-USB cable and do a quick "smoke test," that is, make sure none of your components are overheating. If everything feels okay, proceed to the Arduino IDE.

If you haven't already, configure the Arduino IDE to work with ESP32 boards. In the "Preferences" window, add the following URL to the "Additional Boards Manager URLs" section: `https://dl.espressif.com/dl/package_esp32_index.json`. Go to `Tools > Board > Boards Manager` and install the "ESP32 by Espressif Systems" boards. A more thorough tutorial [is available here](https://randomnerdtutorials.com/installing-the-esp32-board-in-arduino-ide-windows-instructions/).

Under `Tools > Board`, set the board to "ESP32 Dev Module". Open the Double-Oh firmware sketch, located at `/firmware/firmware.ino`. Check that the ESP32 shows up under `Tools > Port` and select it. Upload the file system image by clicking `Tools > ESP32 Sketch Data Upload`. Then upload the firmware with the normal "Upload" button.

There are several possible errors at this stage. If the USB device is not recognized by your computer, then check the soldering of U2, the USB bridge. If you receive a "Timed out waiting for packet header" message, that typically means either U3 or U4 is soldered incorrectly; often, I have found the ESP32 is not fully soldered to the pads. If you receive an "Incorrect packet header" message, you may have a faulty ESP32. A multimeter is handy at this stage to ensure the power circuitry is putting out 3.0-3.3 volts.

## Network Testing

When the firmware is first uploaded, the board should start broadcasting its own Wi-Fi network called "double-oh". Connect to the Wi-Fi network and navigate to an HTTP (not HTTPS) webpage, for example, [www.spacebuck.net](http://www.spacebuck.net) or [www.captainnaps.com](http://www.captainnaps.com). You should see a simple HTML page with Double-Oh network settings that can be customized. I strongly recommend _NOT_ changing the network settings yet; do that after assembly is finished.

## Finishing assembly

Parts used:
- U5 (the only component on the bottom of the PCB)
- Cathode (red) PCB
- Anode (black) PCB
- A short length of stiff wire

Solder part U5, the SOT-23 voltage supervisor, on the bottom side of the PCB. This enables the device to run off a 10440 Li-ion cell. Solder a short length of stiff wire to the anode (black) PCB--this will act as a spring to keep the Li-ion cell in place. Carefully line up the main PCB in the slot of the anode (black) PCB; the antenna should be close to the black PCB and facing outward. Heartily solder the joints together. Then do the same with the cathode (red) PCB.

## Battery testing

Parts used:
- 10440 Li-ion cell

Install the Li-ion cell inside the Double-Oh and check again for the "double-oh" Wi-Fi network.