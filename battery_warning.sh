#!/bin/bash

clear
echo "0 blink" > /proc/acpi/ibm/led
zenity --warning --width 200 --text "Battery is getting low (8%)" 2>/dev/null
echo "0 on" > /proc/acpi/ibm/led
exit