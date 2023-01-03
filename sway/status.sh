# sway-bar otuput

uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

mem_usage=$(free | awk '/^Mem/ { printf("%.2f%", $3/$7 * 100.0) }')

datetime=$(date +'⏳%Y%m%d 🕛%H:%M:%S')

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -n '$s/.*\(..\)$/\1/p')

# emojis
# 📅💾📝😀⏱️⌛⏲️⏰⌚

echo 🖴  🖩 🕒$uptime_formatted 💻$mem_usage 🔊$volume% $datetime

