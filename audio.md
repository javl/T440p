#Audio#

The T440p shows a ```thinkpad_acpi``` card and a ```snd_hda_intel``` card. To get audio working I had to disable the first by modifying ```/etc/modprobe.d/alsa.conf```:
```
options snd_hda_intel enable=0,1
options snd slots=snd_hda_intel, thinkpad_acpi
options snd_hda_intel index=0
options thinkpad_acpi index=1
```

## Airtunes ##
Streaming to an Airport Extreme is easy, just run
```
sudo apt-get install pulseaudio-module-raop paprefs
```
and in ```PulseAudio Preferences``` tick the box ```Make discovarable Apple AirTunes sound devices available locally```. After this you can select what audio output to use for each of your running audio programs in ```PulseAudio Volume Control```. The only problem I'm still having is that the audio from some programs sounds choppy. ```VLC``` for instance wasn't working properly, but in my case ```rhythmbox``` works perfectly.

Other audio application suggestions found on [this forum](http://ubuntuforums.org/showthread.php?t=1435483&page=2&s=b5a32f0f64ddd6b73f9c6412f567b58f) are ```totem```, ```amarok```, ```xine```, ```mplayer```, ```audacious```, ```gmusicplayer``` and ```guayadeque```. 

[Bonus forum](https://forum.videolan.org/viewtopic.php?f=13&t=97111)
