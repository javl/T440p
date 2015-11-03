#Mouse scroll speed#

Install `imwheel`: `sudo apt-get install imwheel`

Then, edit the global defaults:

Edit the settings: `sudo nano /etc/X11/imwheel/imwheelrc`

Add the following to speed up the scrolling system-wide. Note: this does disable the option to use `ctrl+scroll` in your browser/editor to change font size:
    ".*"
    None, Up, Button4, 5
    None, Down, Button5, 5

Now edit the config file to auto-start `imwheel` when you log in:
`sudo nano /etc/X11/imwheel/startup.conf`

Change `IMWHEEL_START=0` to `IMWHEEL_START=1`