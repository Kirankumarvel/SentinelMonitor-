#!/bin/bash

ALERT_MESSAGE=$1

# Load configurations
source "$(dirname "$0")/../config/config.env"

# Send Email Alert
echo -e "$ALERT_MESSAGE" | mail -s "Server Health Alert 🚨" "$ALERT_EMAIL"

# Send Slack Notification
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$ALERT_MESSAGE\"}" "$SLACK_WEBHOOK_URL"
