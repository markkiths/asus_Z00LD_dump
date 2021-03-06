#!/system/bin/sh
action_log='/dev/console'
echo "[550kl_debug] enter init.asus.check_last.sh" > $action_log
echo "ASDF: Check LastShutdown log." > /proc/asusevtlog
echo get_asdf_log > /proc/asusdebug
