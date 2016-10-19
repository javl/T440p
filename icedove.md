#Icedove#
To have Icedove use European dates and clock (24-hours instead of AM/PM), set the locale to en_DK.utf8

For some reason, this locale seems to work best.

First make sure this locale exists. Create it using:
```dpkg-reconfigure locales```


Then, create a wrapper for Icedove that sets this locale by creating ```/usr/local/bin/icedove```:


    #!/bin/sh
    LC_ALL="en_DK.utf8"
    export LC_ALL
    /usr/bin/icedove $@

