#Wakeup problem fix#
Sometimes after I close the lid and the laptop goes to sleep, it will wake up
straight away while still being closed. Especially anoying when it is in your
bag as it can run hot (and will deplete your battery).

I read a suggestion saying it might be caused by a USB device, so we should
disable their wakeup function.
To find out the names of the USB devices, run `lspci | grep USB`. In my case 
they are called `xHCI`, `EHCI #1` and `EHCI #2.

To get a list of all wakeup capable devices, run `cat /proc/acpi/wakeup` (you
should also be able to use `acpitool -w`, but on my device it would only show 
`LID` and `SLPB`). The list shows the same devices with slightly different 
names: `XHCI`, `EHC1` and `EHC2`.
By default, their status is `enabled` so we need to disable them after every
boot. I've added the following lines to `/etc/rc.local`:

    echo EHC1 | sudo tee /proc/acpi/wakeup
    echo EHC2 | sudo tee /proc/acpi/wakeup
    echo XHCI | sudo tee /proc/acpi/wakeup

This disables each of the devices so they can't wake up the computer.
Turns out the USB ports were indeed the problem and the computer went to sleep
like normal again.
