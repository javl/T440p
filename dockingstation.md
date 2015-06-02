#Lenovo Thinkpad Ultra Dock

I'm using one of Lenovo's Ultra Docks, hooked up to an external monitor using the ```DVI``` output.

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

Reload ```acpid``` to enable the new events:
```sudo /etc/init.d/acpid reload```

Now add the two scripts to run. The ```DISPLAY``` and ```XAUTHORITY``` variables are needed to point ```xrandr``` to the right display (without them I had the problem that it was trying to set a display for the root user instead).

On Other devices the screen device names might be different. You can check this using: ```xrandr -q``` to get a list of all attached devices. On the ```T440p```, the internal display is called ```eDP1``` and ```DP2``` is the ```DVI``` output of the dock.

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

Now to make both files executable:
```
chmod +x ~/thinkpad-docking.sh ~/thinkpad-undock.sh
```

Of course you can combine the two files into one and make them do more fancy stuff, but this is all I needed.
