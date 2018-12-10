### Backlight

Control backlight via ```/sys/class/backlight/intel_backlight/``` and a graphical slider

```
#!/bin/sh
#pidof -x $(basename $0)
if pidof -x $(basename $0) > /dev/null; then
  for p in $(pidof -x $(basename $0)); do
    if [ $p -ne $$ ]; then
      #echo "Script $0 is already running: exiting"
      exit
    fi
  done
fi

BrPath='/sys/class/backlight/intel_backlight/'
BrCur=`cat ${BrPath}brightness`
BrMax=`cat ${BrPath}max_brightness`
BrMin=$(( (BrMax + (100 - 1)) / 100))   # 100th max-brightness, rounded up to nearest integer 
yad --scale --min-value $BrMin --max-value $BrMax --value $BrCur --print-partial --title 'Set brightness' --width 300 --fixed --sticky --mouse --on-top --escape-ok --button OK --hide-value | while read BrNew 
   do echo "$BrNew" > ${BrPath}brightness
   done
```
