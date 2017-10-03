### TMP ###

Temporary file to store changes that don't have their own file (yet) / need to be checked.

##### Fixing xbacklight after moving to Jessie stable: #####

```sudo nano /etc/X11/xorg.conf```

    Section "Device"
    Identifier  "Card0"
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
    EndSection

```sudo nano /etc/default grub```

add ```acpi_backlight=vendor``` to ```GRUB_CMDLINE_LINUX_DEFAULT```

```sudo update-grub```
    
##### Disabling renaming of wireless interface (from wlp3s0 back to wlan0) #####
```sudo nano /etc/default/grub```

add ```net.ifnames=0``` to ```GRUB_CMDLINE_LINUX_DEFAULT```

```sudo update-grub```
