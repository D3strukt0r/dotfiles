# Home Assistant

## Setup

Follow https://www.home-assistant.io/installation/raspberrypi

OpenThread Border Router requires a Dummy Device to connect to Matter on the SLZB-MR4U board. So we need to enable UART on the boot partition.

https://github.com/home-assistant/addons/issues/3620

1. Open the `boot` partition of the SD card on your computer.
2. Open the `config.txt` file in a text editor.
3. Add the following line at the end of the file to enable UART:
   ```
   enable_uart=1
   ```
