#!/bin/bash

# Linux Log Analyzer & Alert System
# Author: Anas Siddiqui
# Date: $(date)

LOG_FILE="/var/log/secure"
ALERT_LOG="$HOME/linux-log-analyzer/logs/alert.log"
THRESHOLD=5  # number of failed attempts before alert

echo "[$(date)] Starting Log Analyzer..." >> $ALERT_LOG

# Extract failed SSH login attempts
FAILED_ATTEMPTS=$(grep "Failed password" $LOG_FILE | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr)

if [[ ! -z "$FAILED_ATTEMPTS" ]]; then
    echo "[$(date)] Failed login attempts detected:" >> $ALERT_LOG
    echo "$FAILED_ATTEMPTS" >> $ALERT_LOG

    # Check if threshold exceeded
    echo "$FAILED_ATTEMPTS" | while read count ip; do
        if [ $count -ge $THRESHOLD ]; then
            echo "[$(date)] ALERT: Possible brute force from $ip ($count attempts)" >> $ALERT_LOG
            # Optional: Send alert (uncomment below if mail is configured)
            # echo "ALERT: $ip has $count failed login attempts" | mail -s "SSH Brute Force Alert" root
        fi
    done
else
    echo "[$(date)] No suspicious activity." >> $ALERT_LOG
fi
