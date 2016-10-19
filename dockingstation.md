#Lenovo Thinkpad Ultra Dock

I'm using one of Lenovo's Ultra Docks, hooked up to an external monitor using the ```DVI``` output.

To make Debian expand the desktop to the second screen when docking and reset it to only the laptop's screen on undocking I'm using the following:

Replace javl with your username

```
#/etc/acpi/events/thinkpad-docking
event=ibm/hotkey LEN0068:00 00000080 00004010
action=su javl -c '/home/javl/thinkpad-docking.sh'
```


```
#/etc/acpi/events/thinkpad-undock
event=ibm/hotkey LEN0068:00 00000080 00004011
action=su javl -c '/home/javl/thinkpad-undock.sh'
```

Reload ```acpid``` to enable the new events:
```sudo /etc/init.d/acpid reload```

Now add the two scripts to run. The ```DISPLAY``` and ```XAUTHORITY``` variables are needed to point ```xrandr``` to the right display (without them I had the problem that it was trying to set a display for the root user instead).

On Other devices the screen device names might be different. You can check this using: ```xrandr -q``` to get a list of all attached devices. On the ```T440p```, the internal display is called ```eDP1``` and ```DP2``` is the ```DVI``` output of the dock. For some reason the keyboard speed sometimes changes when docking, so I added a line to fix this to the file as well.

```
#!/bin/sh
export DISPLAY=:0
export XAUTHORITY=/home/javl/.Xauthority
xrandr --output DP2 --primary --mode 1920x1200 --output eDP1 --mode 1600x900 --left-of DP2
# Set the key repeat speed again for the desktop keyboard
xset r rate 300 50
```

```
#/home/javl/thinkpad-undock.sh
export DISPLAY=:0
export XAUTHORITY=/home/javl/.Xauthority
xrandr --auto
```

Now to make both files executable:
```
chmod +x ~/thinkpad-docking.sh ~/thinkpad-undock.sh
```

Of course you can combine the two files into one and make them do more fancy stuff, but this is all I needed.
