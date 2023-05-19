# sway-bar otuput

cpu_temp=$(sensors | awk '/^Package/ { print $4 }')

fan_speed=$(sensors | awk '/^fan2/ { print $2 }')

uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

mem_usage=$(free | awk '/^Mem/ { printf("%.2f%", ($2-$7)/$2 * 100.0) }')

datetime=$(date +'⌛%a 📅%y-%m-%d 🕛%H:%M:%S')

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -n '$s/.*\(..\)$/\1/p')

battery=$(cat /sys/class/power_supply/BAT0/capacity)

# emojis
# 🖩🖴 💾📝😀⏳⏱️⏰⌚

echo 🌡️$cpu_temp ☢️ $fan_speed 🕒$uptime_formatted 💻$mem_usage 🔊$volume% $datetime 🔋$battery%

