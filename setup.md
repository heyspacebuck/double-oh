# Double-Oh Battery Assembly and Setup

## Hardware version 2.7, Firmware version 0.7

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

## Main PCB: Top side assembly

Parts used:
- 35 SMD components (see the [BOM](bom.md))
- Main PCB

All but one of the Double-Oh components are placed on the top side of the PCB. When this side is assembled, we can run the device off USB power and install the Double-Oh firmware. The [interactive BOM](/hardware/bom/ibom.html) makes placing the components a lot easier.

## Firmware installation

Tools used:
- Micro-USB cable
- Arduino IDE
- Multimeter (optional)

Now that the top side of the PCB is assembled, the Double-Oh firmware can be installed. Plug in the micro-USB cable and do a quick "smoke test," that is, make sure none of your components are overheating. If everything feels okay, proceed to the Arduino IDE.

If you haven't already, configure the Arduino IDE to work with ESP32 boards. In the "Preferences" window, add the following URL to the "Additional Boards Manager URLs" section: `https://dl.espressif.com/dl/package_esp32_index.json`. Go to `Tools > Board > Boards Manager` and install the "ESP32 by Espressif Systems" boards. A more thorough tutorial [is available here](https://randomnerdtutorials.com/installing-the-esp32-board-in-arduino-ide-windows-instructions/).

To select the Double-Oh board in the Arduino IDE, take the folder `/firmware/Double-Oh Arduino Platform` out of this repo and copy it into your Arduino sketchbook's "Hardware" folder. The folder's new location should be `{your Arduino sketchbook directory}/Hardware/Double-Oh Arduino Platform`. Restart the Arduino IDE. Now, you should be able to select the Double-Oh board under `Tools > Board > Double-Oh > Double-Oh`. **ALTERNATELY:** you can use the "ESP32 Dev Module" from Espressif's boards. If you do this ***make sure PSRAM is disabled!*** As of writing this (July 2021), enabling PSRAM will cause an endless kernel panic reboot cycle, effectively bricking the ESP32.

![Screenshot of the Arduino IDE](/img/arduinoIDE.png)

Open the Double-Oh firmware sketch, located at `/firmware/firmware.ino`. Check that the ESP32 shows up under `Tools > Port` and select it. Upload the file system image by clicking `Tools > ESP32 Sketch Data Upload`. Then upload the firmware with the normal "Upload" button.

**Troubleshooting:** I've encountered several possible errors at this stage, mostly stemming from bad soldering on U2, U3, and U4. If the USB device is not recognized by your computer, that's probably an issue with U2, the USB-to-UART bridge IC. Check that U3 is putting out at least 3.0 volts to power the ESP32; you can do this by probing the locations shown here:

![Showing which two points to probe for voltage measurements](/img/checkvoltage.png)

If you receive a "Timed out waiting for packet header" message, that typically means either U3 or U4 is soldered incorrectly; often, I have found the ESP32 is not fully soldered to the pads. If you receive an "Incorrect packet header" message, it could mean that the RTS signal is too noisy; you can try increasing the capacitance of C3, the capacitor next to the dual-NPN transistor package.

## Network Testing

When the firmware is first uploaded, the board should start broadcasting its own Wi-Fi network called "double-oh". Connect to the Wi-Fi network and navigate to `http://doubleoh.local` . You should see a simple HTML page with Double-Oh network settings that can be customized.

## Finishing assembly

Parts used:
- U5 (the only component on the bottom of the PCB)
- Cathode (red) PCB
- Anode (black) PCB
- Something to keep the battery in place--a short length of stiff wire, or a [battery terminal spring](https://www.digikey.com/en/products/detail/keystone-electronics/242/7561622), or an [EMI shield finger](https://www.digikey.com/en/products/detail/harwin-inc/S7081-42R/3131061)

Solder part U5, the SOT-23 voltage supervisor, on the bottom side of the PCB. This enables the device to run off a 10440 Li-ion cell.

Take the anode (black) PCB and solder a spring or wire or something to the inner face (the side with a smaller circle on it). This is the part of assembly that I really haven't solved yet. A stiff wire works well, most of the time. Sometimes a single 1.5mm spring suffices; sometimes I have to solder a second 1.5mm spring onto the cathode (red) PCB as well. It's a bit of a mess.

![Different boards with different spring options](/img/springthings.jpg)

Carefully line up the main PCB in the slot of the anode (black) PCB; the antenna should be close to the black PCB and facing outward. Tack-solder one joint and check the boards for alignment. When the main board and anode board are aligned, . Then do the same with the cathode (red) PCB.

## Battery testing

Parts used:
- 10440 Li-ion cell

Install the Li-ion cell inside the Double-Oh and check again for the "double-oh" Wi-Fi network.