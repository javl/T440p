#!/bin/bash

VOLUME=$1
if [ $VOLUME == "mute" ]; then
  for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`
    do
      pactl set-sink-mute $SINK toggle
    done
else
  for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`
    do
      pactl set-sink-volume $SINK $VOLUME
    done
fi

