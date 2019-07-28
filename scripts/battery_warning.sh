#!/bin/bash
# This file gets called by tint2 (see tint2rc) when the battery gets below 5%

clear

# Start blinking the power button light. Useful for spotting the message from a distance
echo "0 blink" > /proc/acpi/ibm/led
zenity --warning --width 200 --text "Battery is getting low (5%)" 2>/dev/null
# After the zenity warning has been closed, make the LED solid again
echo "0 on" > /proc/acpi/ibm/led
exit
