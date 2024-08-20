# General Linux Shell Script
## Create scripts folder
```
# change directory to home folder
cd ~
mkdir scripts
```
## Auto Yum Update
### auto_update.sh
Auto yum update script for RHEL
```
# cron job
# Execute auot_update.sh at 22:00 on every Saturday
0 22 * * 6 /root/scripts/auto_update.sh
```
