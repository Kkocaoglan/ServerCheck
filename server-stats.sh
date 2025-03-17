#!/bin/bash

echo Server Performance Stats


CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk  '{print 100 - $8"%"}')
echo "CPU  Usage: $CPU_USAGE"

MEMORY=$(free -m | awk 'NR==2{printf "Usage: %sMB / %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')
echo "Memory Usage : $MEMORY"

DISK=$(df -h  --total | grep 'total' | awk '{printf "Usage:%s / %s (%d%%)\n", $3, $2, $5}')
echo "Disk Usage : $DISK"

UPTIME=$(uptime -p)
echo "System working: $UPTIME"

echo "Most 5 process that using Cpu:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6

echo "Most 5 process that using Ram"

ps -eo pid,comm,%mem --sort=-%mem | head -6

echo "Active Users:"
who

