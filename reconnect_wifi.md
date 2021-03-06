I've been using Wicd for a long time now, but I always had the problem it didn't
reconnect to my wifi network when my computer had been in sleep mode and I 
reopened my laptop.

When I open my laptop I want to reconnect to my known networks, but only if the
network is protected (I don't want to auto-connect to any public networks).

My solution is to have [a script](https://github.com/javl/T440p/blob/master/99_reconnect_wifi) that runs whenever my computer resumes. After creating this file, make sure it's owned by root and can be executed (```chmod +x```).
The script calls [a python script](https://github.com/javl/T440p/blob/master/wifireconnect.py) (as root) that in turn does the following:
Get all (encrypted) wifi networks known to wicd and compare them to a list of currently available networks. Then connect to the first match using wicd-cli (make sure it's installed using ```sudo apt-get install wicd-cli```).
