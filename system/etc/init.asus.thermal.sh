#!/system/bin/sh

# No path is set up at this point so we have to do it here.
echo "[ZE550KL_Thermal]start test script"
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

#set ultimate prop 0
setprop sys.ultimate.mode 0
setprop sys.thermal-performance.mode 0
# Identify the cpu type
zone8_exit=`ls /sys/class/thermal/thermal_zone8/`

if test "$zone8_exit"; then
	cpu=8929
else
	cpu=8916
fi

ln -s /proc/fac_thermal_zone0                   /data/data/Thermal0
ln -s /proc/fac_thermal_zone1                   /data/data/Thermal1
ln -s /proc/fac_thermal_zone2                   /data/data/Thermal2
ln -s /proc/fac_thermal_zone3                   /data/data/Thermal3
ln -s /proc/fac_thermal_zone4                   /data/data/Thermal4
ln -s /proc/fac_pa_therm0                       /data/data/Thermal8
ln -s /proc/fac_xo_therm                        /data/data/Thermal9

# create symbolic link for run-in test
if test "$cpu" = "8916"; then
	echo "CPU type is 8916"
	ln -s /sys/class/thermal/thermal_zone5/temp /data/data/Thermal5
	ln -s /sys/class/thermal/thermal_zone6/temp /data/data/Thermal6
	ln -s /sys/class/thermal/thermal_zone7/temp /data/data/Thermal7
	sleep 10
	echo 10 > /data/data/ThermalCount
	chmod 664 /data/data/ThermalCount
else
	echo "CPU type is 8929"
	ln -s /sys/class/thermal/thermal_zone9/temp /data/data/Thermal5
	ln -s /sys/class/thermal/thermal_zone10/temp /data/data/Thermal6
	ln -s /sys/class/thermal/thermal_zone11/temp /data/data/Thermal7
	sleep 10
	echo 10 > /data/data/ThermalCount
	chmod 664 /data/data/ThermalCount
fi

