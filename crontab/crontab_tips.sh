#!/bin/sh
#
# File: crontab_tips.sh
# Author: Colps
# Github: https://github.com/colpshift
# Description: crontab tips
# Last Modified: 23/02/2019 22:15
#

# How to List Crontab
# To view crontab entries of current user use the following command.
crontab -l

# Use -u followed by username to view crontab entries of the specified user.
crontab -u username -l

# 20 Useful Crontab Examples

# 1. Schedule a cron to execute at 2am daily.
# This will be useful for scheduling database backup on daily basis.
0 2 * * * /bin/sh backup.sh

# 2. Schedule a cron to execute twice a day.
# Below example command will execute at 5 AM and 5 PM daily. 
# You can specify multiple time stamp by comma separated.
0 5,17 * * * /scripts/script.sh

# 3. Schedule a cron to execute on every minutes.
# Generally, we don’t require any script to execute on every minute but in some
# case, you may need to configure it.
* * * * *  /scripts/script.sh

# 4. Schedule a cron to execute on every Sunday at 5 PM.
# This type of cron is useful for doing weekly tasks, like log rotation etc.
0 17 * * sun  /scripts/script.sh

# 5. Schedule a cron to execute on every 10 minutes.
# If you want to run your script on 10 minutes interval, can configure like 
# below. These type of crons are useful for monitoring.
*/10 * * * * /scripts/monitor.sh
# */10: means to run on every 10 minutes. Same as if you want to execute on 
# every 5 minutes use */5.

# 6. Schedule a cron to execute on selected months.
# Sometimes we required scheduling a task to be executed for selected months
# only. Below example script will run in January, May and August months.
* * * jan,may,aug *  /script/script.sh

# 7. Schedule a cron to execute on selected days.
# If you required scheduling a task to be executed for selected days only.
# Below example will run on each Sunday and Friday at 5 PM.
0 17 * * sun,fri  /script/script.sh

# 8. Schedule a cron to execute on first sunday of every month.
# To schedule a script to execute a script on first Sunday only is not possible
# by time parameter, But we can use the condition in command fields to do it.
0 2 * * sun  [ $(date +%d) -le 07 ] && /script/script.sh

# 9. Schedule a cron to execute on every four hours.
# If you want to run a script on 4 hours interval. It can be configured like 
# below.
0 */4 * * * /scripts/script.sh

# 10. Schedule a cron to execute twice on every Sunday and Monday.
# To schedule a task to execute twice on Sunday and Monday only. 
# Use following settings to do it.
0 4,17 * * sun,mon /scripts/script.sh

# 11. Schedule a cron to execute on every 30 Seconds.
# To schedule a task to execute on every 30 seconds is not possible by time
# parameters, But it can be done by schedule same cron twice like below.
* * * * * /scripts/script.sh
* * * * *  sleep 30; /scripts/script.sh

# 12. Schedule a multiple tasks in single cron.
# To configure multiple tasks with single cron, Can be done by separating tasks
# by the semicolon ( ; ).
* * * * * /scripts/script.sh; /scripts/scrit2.sh

# 13. Schedule tasks to execute on yearly ( @yearly ).
@yearly timestamp is similar to “0 0 1 1 *”. 
# It will execute task on the first minute of every year, 
# It may useful to send new year greetings 
@yearly /scripts/script.sh

# 14. Schedule tasks to execute on monthly ( @monthly ).
@monthly timestamp is similar to “0 0 1 * *”. 
# It will execute a task in the first minute of the month. 
# It may useful to do monthly tasks like paying the bills and invoicing
# to customers.
@monthly /scripts/script.sh

# 15. Schedule tasks to execute on Weekly ( @weekly ).
@weekly timestamp is similar to “0 0 1 * mon”. 
# It will execute a task in the first minute of the week. It may useful to do
# weekly tasks like the cleanup of system etc.
@weekly /bin/script.sh

# 16. Schedule tasks to execute on daily ( @daily ).
@daily timestamp is similar to “0 0 * * *”. 
# It will execute a task in the first minute of every day, 
# It may useful to do daily tasks.
@daily /scripts/script.sh

# 17. Schedule tasks to execute on hourly ( @hourly ).
@hourly timestamp is similar to “0 * * * *”. 
# It will execute a task in the first minute of every hour,
# It may useful to do hourly tasks.
@hourly /scripts/script.sh

# 18. Schedule tasks to execute on system reboot ( @reboot ).
# @reboot is useful for those tasks which you want to run on your system
# startup. It will be same as system startup scripts. 
# It is useful for starting tasks in the background automatically.
@reboot /scripts/script.sh

# 19. Redirect Cron Results to specified email account.
# By default, cron sends details to the current user where cron is scheduled.
# If you want to redirect it to your other account, can be done by setup 
# MAIL variable like below
crontab -l
MAIL=bob
0 2 * * * /script/backup.sh

# 20. Taking backup of all crons to plain text file.
# I recommend keeping a backup of all jobs entry in a file. 
# This will help you to recover crons in case of accidental deletion.
# Check current scheduled cron:
crontab -l
MAIL=rahul
0 2 * * * /script/backup.sh

# Backup cron to text file:
crontab -l > cron-backup.txt
# cat cron-backup.txt
MAIL=rahul
0 2 * * * /script/backup.sh

# Removing current scheduled cron:
crontab -r
crontab -l
no crontab for root

# Restore crons from text file:
crontab cron-backup.txt
crontab -l
MAIL=rahul
0 2 * * * /script/backup.sh

