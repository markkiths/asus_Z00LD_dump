#!/system/bin/sh
debugFile="/proc/driver/audio_debug"
audbg_mode=`getprop persist.asus.audbg`
while [ ! -e "$debugFile" ]
do
echo "audio debug node not exist,wait..."
sleep 1
done
echo "$audbg_mode" > /proc/driver/audio_debug
