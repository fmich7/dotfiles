#!/bin/sh
#modern problems require modern solutions

muteDelay=.1

while true; do
   amixer set Capture nocap; #mute
   sleep $muteDelay;
   amixer set Capture cap; #unmute
   sleep $muteDelay;
done
