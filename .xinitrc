# Set permissions for LED (used for low-power message
# See the battery_warning.sh file on Github
chown javl:root /sys/devices/platform/thinkpad_acpi/leds/tpacpi::power/brightness
chown javl:root /proc/acpi/ibm/led

# Start Synapse daemon
synapse -s &

# Start xbindkeys for hotkeys
xbindkeys &

# Start notification daemon
/usr/lib/notification-daemon/notification-daemon &

# Start tint2
tint2 &

# Speed up keyrepeat and shorten repeat delay
xset r rate 300 50

# Enable tapping on trackpad
synclient TapButton1=1 &

#This doesn't work? Need to check why
synclient VertTwoFingerScroll=1 &

# Start openbox
exec openbox
