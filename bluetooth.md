### Bluetooth

Instructions originally from here:
https://www.maketecheasier.com/setup-bluetooth-in-linux/

1. Install needed packages:

`sudo apt-get install bluetooth bluez bluez-tools rfkill blueman`

2. Check if device isn't blocked:

`sudo rfkill list`

In my case this shows:

    0: tpacpi_bluetooth_sw: Bluetooth
        Soft blocked: no
        Hard blocked: no
    1: phy0: Wireless LAN
        Soft blocked: no
        Hard blocked: no
    2: hci0: Bluetooth
        Soft blocked: no
        Hard blocked: no

3. If blocked, unblock:

`sudo rfkill unblock bluetooth`

4. Make sure bluetooth service is running:

`sudo service bluetooth start`

5. We already installed `blueman`, so now we can start the `blueman-manager` 
gui from commandline or quick start menu to connect to devices.
