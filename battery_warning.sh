#!/bin/bash

# This file needs a couple of permissions to be set beforehand.
# Those can be found in the .xinitrc file

clear
# Start blinking the power button light. Useful for spotting an
# empty battery from a distance
echo "0 blink" > /proc/acpi/ibm/led
zenity --warning --width 200 --text "Battery is getting low (8%)" 2>/dev/null
# After the zenity warning has been closed, make the LED solid again
echo "0 on" > /proc/acpi/ibm/led
exit
