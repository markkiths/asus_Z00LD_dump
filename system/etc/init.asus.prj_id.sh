#!/system/bin/sh

prj_id=`cat /proc/apid`
setprop ro.pro.apid $prj_id
