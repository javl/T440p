#Audio#

The T440p shows a ```thinkpad_acpi``` card and a ```snd_hda_intel``` card. To get audio working I had to disable the first by modifying ```/etc/modprobe.d/alsa.conf```:
```
options snd_hda_intel enable=0,1
options snd slots=snd_hda_intel, thinkpad_acpi
options snd_hda_intel index=0
options thinkpad_acpi index=1
```
