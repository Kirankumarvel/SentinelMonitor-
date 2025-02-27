# 🛡️ SentinelMonitor - Automated Server Health Check & Alert System 🚀

Monitor CPU, RAM, Disk Usage, and Uptime & Get Instant Alerts via Email/Slack

## 📌 Overview

SentinelMonitor is a lightweight Bash-based monitoring tool that tracks system health in real-time and sends alerts via Email or Slack when predefined thresholds are exceeded.

## ✅ Monitors:

- CPU Usage
- RAM Usage
- Disk Space
- System Uptime

## ✅ Alerting System:

- 📩 Email Notifications
- 🔔 Slack Alerts

## ✅ Automation:

- Runs every 10 minutes via a cron job
- Logs health data for tracking historical performance

## 📁 Project Structure

```plaintext
server-health-check/
│── scripts/
│   ├── health_check.sh       # Main monitoring script
│   ├── send_alert.sh         # Script to send alerts via Email/Slack
│── config/
│   ├── config.env            # Configuration file (thresholds & alert settings)
│── logs/
│   ├── health.log            # Stores system health logs
│── .gitignore                # Ignores sensitive files
│── README.md                 # Project documentation
│── cronjob.txt               # Cron job setup guide
```

## 🚀 Installation & Setup

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/yourusername/sentinelmonitor.git
cd sentinelmonitor
```

### 2️⃣ Install Required Dependencies

```bash
sudo apt update && sudo apt install -y curl mailutils
```

### 3️⃣ Configure Alert Settings

Edit the `config/config.env` file to define CPU, RAM, and Disk space thresholds & set alerting details:

```bash
# Threshold values
CPU_THRESHOLD=80
RAM_THRESHOLD=80
DISK_THRESHOLD=90

# Slack Webhook URL
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/XXXXXX"

# Email settings
ALERT_EMAIL="admin@example.com"
```

### 4️⃣ Make Scripts Executable

```bash
chmod +x scripts/health_check.sh scripts/send_alert.sh
```

### 5️⃣ Run the Health Check Manually

```bash
./scripts/health_check.sh
```

## 🔄 Automate with Cron Job

To run the script every 10 minutes, edit the crontab:

```bash
crontab -e
```

Add this line:

```bash
*/10 * * * * /bin/bash /path/to/sentinelmonitor/scripts/health_check.sh
```

## 📝 How It Works

1. `health_check.sh` collects CPU, RAM, Disk, and Uptime data.
2. If any metric exceeds the defined thresholds, it triggers an alert.
3. `send_alert.sh` sends an email and a Slack notification with details.
4. Logs are stored in `logs/health.log` for analysis.

## 📊 Example Output & Alerts

### ✅ Normal Output (Logged in `health.log`)

```plaintext
2025-02-27 10:00:01 - CPU: 45%, RAM: 60%, DISK: 70%, Uptime: 12 days
```

### 🚨 Alert (Email/Slack Notification)

```plaintext
⚠️ High CPU Usage: 90% (Threshold: 80%)
⚠️ High RAM Usage: 85% (Threshold: 80%)
```

## 📌 Future Improvements

- Add support for Microsoft Teams / Telegram alerts
- Store logs in a database for visualization
- Create a web dashboard for real-time monitoring

## 📜 License

This project is open-source under the MIT License.

## 📢 Need help? Open an issue or contribute! 🎯

- 🔹 GitHub: https://github.com/Kirankumarvel/SentinelMonitor-
- 🔹 Author: Kiran Kumar V

🚀 Happy Monitoring! 🛡️


