#!/system/bin/sh
LOG_TAG="asus_monitor"
fmrssi=-2

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$@"
}

logd ()
{
  /system/bin/log -t $LOG_TAG -p d "$@"
}

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$@"
}
cat /proc/cpuinfo |grep MSM8939 > /dev/null 2>&1 || exit
state=`getprop asus.camera.recording`
case "$state" in
	"false")
			loge "not recording"
			if [ "$(cat /sys/devices/system/cpu/cpu0/online)" == "0" ];then
				echo 1 > /sys/devices/system/cpu/cpu0/online
				echo 1 > /sys/devices/system/cpu/cpu1/online
				echo 1 > /sys/devices/system/cpu/cpu2/online
				echo 1 > /sys/devices/system/cpu/cpu3/online
			fi
			if [ "$(cat /sys/devices/system/cpu/cpu4/online)" == "0" ];then
				echo 1 > /sys/devices/system/cpu/cpu4/online
				echo 1 > /sys/devices/system/cpu/cpu5/online
				echo 1 > /sys/devices/system/cpu/cpu6/online
				echo 1 > /sys/devices/system/cpu/cpu7/online
			fi
	;;
	"true")
			loge "recording"
		if [ "$(cat /sys/devices/system/cpu/cpu0/online)" == "1" ];then
			echo 0 > /sys/devices/system/cpu/cpu0/online
			echo 0 > /sys/devices/system/cpu/cpu1/online
			echo 0 > /sys/devices/system/cpu/cpu2/online
			echo 0 > /sys/devices/system/cpu/cpu3/online
		fi
		if [ "$(cat /sys/devices/system/cpu/cpu4/online)" == "0" ];then
			echo 1 > /sys/devices/system/cpu/cpu4/online
			echo 1 > /sys/devices/system/cpu/cpu5/online
			echo 1 > /sys/devices/system/cpu/cpu6/online
			echo 1 > /sys/devices/system/cpu/cpu7/online
		fi
	;;
esac

case "$state" in
	"low_light_false")
			if [ "$(cat /sys/devices/system/cpu/cpu0/online)" == "0" ];then
				echo 1 > /sys/devices/system/cpu/cpu0/online
				echo 1 > /sys/devices/system/cpu/cpu1/online
				echo 1 > /sys/devices/system/cpu/cpu2/online
				echo 1 > /sys/devices/system/cpu/cpu3/online
			fi
			if [ "$(cat /sys/devices/system/cpu/cpu4/online)" == "0" ];then
				echo 1 > /sys/devices/system/cpu/cpu4/online
				echo 1 > /sys/devices/system/cpu/cpu5/online
				echo 1 > /sys/devices/system/cpu/cpu6/online
				echo 1 > /sys/devices/system/cpu/cpu7/online
			fi
	;;
	"low_light_true")
			if [ "$(cat /sys/devices/system/cpu/cpu0/online)" == "0" ];then
				echo 1 > /sys/devices/system/cpu/cpu0/online
				echo 1 > /sys/devices/system/cpu/cpu1/online
				echo 1 > /sys/devices/system/cpu/cpu2/online
				echo 1 > /sys/devices/system/cpu/cpu3/online
			fi
			if [ "$(cat /sys/devices/system/cpu/cpu4/online)" == "1" ];then
				echo 0 > /sys/devices/system/cpu/cpu4/online
				echo 0 > /sys/devices/system/cpu/cpu5/online
				echo 0 > /sys/devices/system/cpu/cpu6/online
				echo 0 > /sys/devices/system/cpu/cpu7/online
			fi
	;;
esac