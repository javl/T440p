### Mouse scroll speed ###

Install `imwheel`: `sudo apt-get install imwheel`

Edit the default settings: `sudo nano /etc/X11/imwheel/imwheelrc`

Add the following to speed up the scrolling system-wide. Note: this does disable the option to use `ctrl+scroll` in your browser/editor to change font size:

    ".*"
    None, Up, Button4, 4
    None, Down, Button5, 4

Now edit `/etc/X11/imwheel/startup.conf` to auto-start `imwheel` when you log in by changing `IMWHEEL_START=0` to `IMWHEEL_START=1`.
