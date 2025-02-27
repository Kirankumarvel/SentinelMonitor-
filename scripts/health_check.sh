#!/bin/bash

# Load configurations
source "$(dirname "$0")/../config/config.env"

# Get system metrics
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
RAM_USAGE=$(free | awk '/Mem/ {printf("%.2f"), $3/$2*100}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
UPTIME=$(uptime -p)

# Log results
LOG_FILE="$(dirname "$0")/../logs/health.log"
echo "$(date) - CPU: $CPU_LOAD%, RAM: $RAM_USAGE%, DISK: $DISK_USAGE%, Uptime: $UPTIME" >> "$LOG_FILE"

# Check if any value exceeds the threshold
ALERT_MSG=""
if [ "$CPU_LOAD" -gt "$CPU_THRESHOLD" ]; then
    ALERT_MSG+="⚠️ High CPU Usage: $CPU_LOAD% (Threshold: $CPU_THRESHOLD%)\n"
fi
if (( $(echo "$RAM_USAGE > $RAM_THRESHOLD" | bc -l) )); then
    ALERT_MSG+="⚠️ High RAM Usage: $RAM_USAGE% (Threshold: $RAM_THRESHOLD%)\n"
fi
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    ALERT_MSG+="⚠️ High Disk Usage: $DISK_USAGE% (Threshold: $DISK_THRESHOLD%)\n"
fi

# Send alert if needed
if [ ! -z "$ALERT_MSG" ]; then
    "$(dirname "$0")/send_alert.sh" "$ALERT_MSG"
fi
