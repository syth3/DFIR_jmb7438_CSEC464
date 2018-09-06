#! /bin/bash

# get-date() {
#     local current_time=$(date +%H:%M:%S\ %Z)
#     echo "$current_time"
# }
# 
# get-uptime() {
#     local uptime=$(uptime --pretty)
#     echo "$uptime"
# }

main() {
    current_time=$(date +%H:%M:%S\ %Z)
    echo "Current Time: $current_time"

    uptime=$(uptime --pretty)
    echo "Uptime: $uptime"

    os_version=$(uname -a)
    echo "OS Version: $os_version"

    cpu_info=$(lscpu | grep "Model name" | awk '{print $3, $4, $5}')
    echo "CPU Info: $cpu_info"
    
    ram_size=$(grep MemTotal /proc/meminfo | awk '{print $2/(1024*1024) " GB"}')
    echo "RAM Size: $ram_size"

    total_hdd_size=$(lsblk --output SIZE -n | head -n 1 | cut -c 2-)
    echo "HDD Size: $total_hdd_size"

    hard_drives=$(lsblk | awk '{if ($6 == "disk") print $1}' | sed ':a;N;$!ba;s/\n/, /g')
    echo "Hard Drives: $hard_drives"
}

main
