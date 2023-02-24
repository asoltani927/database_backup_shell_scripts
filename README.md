# Database backup shell scripts
Shell Scripts for Backuping Database
 
## MySQL & MariaDB

### First Step: Creating Backup
For Creating database backup files, copy and put MySql_Create_Backup.sh file to database server and adding it to crontab for running.

```<Terminal>
// on the server terminal
> sudo crontab -e
```
Put this command and save it. by [Crontab site ](https://crontab.guru/) you can generate the backuping time.
```<Terminal>
# m h  dom mon dow   command
30 2 * * *  sh /home/ubuntu/bk/bg-ft.sh
```
### Second Step: Sending By FTP To Backup Server
For Sending database backup files to a stroage by FTP, copy and put Mysql_Backups_To_Ftp.sh file to database server and adding it to crontab for running it like before to crontab for running.

## Author
Amin Soltani Tehrani <asoltani927@gmail.com>
