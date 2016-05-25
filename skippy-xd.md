#Skippy-xd Settings#

To easily switch between application, I've installed ```skippy-xd```, which works a lot like ```expose``` on OSX, showing previews of all the applications that are currently running.

Skippy-xd can be found [here](https://github.com/richardgv/skippy-xd) and can be installed using ```make && sudo make install```.

You can change the settings in ```/etc/xdg/skippy-xd.rc```. My skippy-xd.rc file can be found [here](https://github.com/javl/T440p/blob/master/skippy-xd.rc).

I used ```xbindkeys``` to make a shortcut to a simple shell script that will open ```skippy-xd```, or kill the process if it is already running (instead of opening another instance).

```bash
#!/bin/sh

if ps ax | grep -v grep | grep "skippy-xd" > /dev/null
then
    pkill skippy-xd
else
    /usr/bin/skippy-xd
fi
```