#!/bin/sh -x
#This is normal mode
PANEL_ID=`cat /proc/lcd_id`
#disable inoutdoor mode
setprop persist.asus.inoutdoor 0
setprop sys.power-performance.mode 1
#disable DPST function
if [ $PANEL_ID -ne 4 ] && [ $PANEL_ID -ne 6 ] && [ $PANEL_ID -ne 7 ]; then
	echo 0 > /proc/cabc_mode_switch
fi




