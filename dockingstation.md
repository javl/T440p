#Lenovo Thinkpad Ultra Dock

I'm using one of Lenovo's Ultra Docks, hooked up to an external monitor using the DVI output.

To make Debian expand the desktop to the second screen when docking and reset it to only the laptop's screen on undocking I'm using the following:

Replace $USER with your username

```
#/etc/acpi/events/thinkpad-docking
event=ibm/hotkey LEN0068:00 00000080 00004010
action=su $USER -c '/home/$USER/thinkpad-docking.sh'
```


```
#/etc/acpi/events/thinkpad-undock
event=ibm/hotkey LEN0068:00 00000080 00004011
action=su $USER -c '/home/$USER/thinkpad-undock.sh'
```

Reload acpid to enable the new events:
```sudo /etc/init.d/acpid reload```

Now add the two scripts. The ```DISPLAY``` and ```XAUTHORITY``` variables are needed to point xrandr to the right display (without them I had the problem that it was trying to set a display for the root user instead)

```
#/home/$USER/thinkpad-docking.sh
#!/bin/sh
export DISPLAY=:0
export XAUTHORITY=/home/$USER/.Xauthority
xrandr --output DP2 --mode 1920x1200 --right-of eDP1
```

```
#/home/$USER/thinkpad-undock.sh
export DISPLAY=:0
export XAUTHORITY=/home/$USER/.Xauthority
xrandr --auto
```