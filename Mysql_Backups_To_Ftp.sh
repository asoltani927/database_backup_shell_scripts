#!/bin/bash

################################################################
##
##   Transfer Backup Througth ftp Script
##   Written By: Amin Soltani
##   URL: https://asoltani.ir
##   Last Update: Mar 15, 2021
##
################################################################

export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=`date +"%d%b%Y"`

################################################################
################## Update below values  ########################
DATABASE_NAME='Database Name'
DB_BACKUP_PATH='/var/backup/db'
FTP_HOST='FTP Host (IP address)'
FTP_PORT='FTP Port'
FTP_USER='FTP Username'
FTP_PASSWORD='FTP Password'
DISTINATION_PATH='/'

#################################################################
if test -f "$DB_BACKUP_PATH/$TODAY/$DATABASE_NAME-$TODAY.sql.gz";  then

        echo "Transfer started for database - ${TODAY}.sql.gz"
        echo "${DB_BACKUP_PATH}/${TODAY}/${DATABASE_NAME}-${TODAY}.sql.gz"
        ftp -n ${FTP_HOST} <<END_SCRIPT
        user $FTP_USER $FTP_PASSWORD
        binary
        cd $DISTINATION_PATH
        put $DB_BACKUP_PATH/$TODAY/$DATABASE_NAME-$TODAY.sql.gz $DATABASE_NAME-$TODAY.sql.gz
        bye

END_SCRIPT

#       scp -P ${FTP_PORT} -r ${DB_BACKUP_PATH}/${TODAY}/${DATABASE_NAME}-${TODAY}.sql.gz ${FTP_USER}@${FTP_HOST}:${DISTINATION_PATH}

        if [ $? -eq 0 ]; then
          echo "Transfer successfully completed"
        else
          echo "Error found during transfer"
          exit 1
        fi

else
  echo "File not found." 1
  exit
fi


exit 0
