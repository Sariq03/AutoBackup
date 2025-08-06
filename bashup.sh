
#!/bin/bash

# Load config
source ./config.conf

# Timestamp for backup file
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Start backup
echo "[$(date)] Starting backup..." >> "$LOG_FILE"

if tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>>"$LOG_FILE"; then
    echo "[$(date)] Backup successful: $BACKUP_FILE" >> "$LOG_FILE"
else
    echo "[$(date)] Backup FAILED!" >> "$LOG_FILE"
    exit 1
fi

# Delete old backups
find "$BACKUP_DIR" -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;

# Log cleanup
echo "[$(date)] Old backups cleaned (>$RETENTION_DAYS days)" >> "$LOG_FILE"
echo "[$(date)] Backup completed." >> "$LOG_FILE"

