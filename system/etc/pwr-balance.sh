#!/bin/sh -x
#This is balance mode
#enable inoutdoor mode
setprop persist.asus.inoutdoor 1
setprop sys.power-performance.mode 0
#enable DPST function
echo 2 > /proc/cabc_mode_switch
