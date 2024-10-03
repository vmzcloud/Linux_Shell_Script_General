<img src="https://img.shields.io/badge/language-shell-green.svg"/> <img src="https://img.shields.io/github/last-commit/vmzcloud/Linux_Shell_Script_General"/>

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
## Performance Stat
### sar_avg.sh
Generate cpu usage and memory usage using sar
```
# cron job
0 7 * * * /root/scripts/sar-avg.sh
```
## Audit Report
### gen-aureport.sh
Generate audit report
```
# cron job
0 6 1 * * /root/scripts/gen-aureport.sh
```
