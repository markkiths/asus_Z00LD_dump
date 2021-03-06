#!/system/bin/sh
audbg_mode=`getprop persist.asus.audbg`
echo "check audio debug mode $audbg_mode" > /proc/driver/audio_debug
case "$audbg_mode" in
  "0")
    setprop persist.asus.audbg 0
    ;;
  "1")
    setprop persist.asus.audbg 1
    ;;
  "")
    setprop persist.asus.audbg 0
    ;;
esac
