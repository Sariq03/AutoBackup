# AutoBackup


This project contains a simple bash script that automatically creates backups.

## Schedule
The script runs at the following crontab schedule:
5 0 * 8 * /root/AutoBackup/backup.sh

## How to use
1. Clone the repository.
2. Make the script executable:
   chmod +x backup.sh
3. Edit crontab:
   crontab -e
   Add the line:
   5 0 * 8 * /root/AutoBackup/backup.sh

## Notes
- Do not commit large backup files.
- Author: Sariq Shaikh
