### TMP ###

Temporary file to store changes that don't have their own file (yet) / need to be checked.

##### Fixing xbacklight after moving to Jessie stable: #####

```sudo nano /etc/X11/xorg.conf```

    Section "Device"
    Identifier  "Card0"
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
    EndSection
    
