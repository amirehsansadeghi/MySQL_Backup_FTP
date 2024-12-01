#!/bin/bash

DATABASE_NAME=""
DATABASE_USERNAME=""
DATABASE_PASSWORD=""
BACKUP_PATH=""
BACKUP_FILENAME=""
REMOTE_IP=""
REMOTE_PORT=""
REMOTE_USERNAME=""
REMOTE_PASSWORD=""

SPACES="                                        "

while getopts "d:u:p:b:f:i:O:U:P:h:?" opt; do
    case $opt in
            d) DATABASE_NAME=$OPTARG ;;
            u) DATABASE_USERNAME=$OPTARG ;;
            p) DATABASE_PASSWORD=$OPTARG ;;
            b) BACKUP_PATH=$OPTARG ;;
            f) BACKUP_FILENAME=$OPTARG ;;
            i) REMOTE_IP=$OPTARG ;;
            O) REMOTE_PORT=$OPTARG ;;
            U) REMOTE_USERNAME=$OPTARG ;;
            P) REMOTE_PASSWORD=$OPTARG ;;
            h) 
                echo -e "Usage: $0 \n 
                -d   <database_name>${SPACES:0:30}Database Name \n\
                -u   <username>${SPACES:0:35}Database Username \n\
                -p   <password>${SPACES:0:35}Database Password \n\
                -b   <backup_path>${SPACES:0:32}Backup Path in the local Server \n\
                -f   <backup_filename>${SPACES:0:28}Backup Filename \n\
                -i   <remote_ip>${SPACES:0:34}FTP server IP address or hostname \n\
                -O   <remote_port>${SPACES:0:32}FTP Server port number (default port number is 21) \n\
                -U   <remote_username>${SPACES:0:28}FTP Server Username \n\
                -P   <remote_password>${SPACES:0:28}FTP Server password"
                exit 0 ;;
            ?) 
                echo "Invalid option: -$OPTARG"
                exit 1 ;;
    esac
done

if [[ -z "$REMOTE_PORT" ]] ; then
    REMOTE_PORT="21"
fi
 
if [[ -z "$DATABASE_NAME" || -z "$DATABASE_USERNAME" || -z "$DATABASE_PASSWORD" || -z "$BACKUP_PATH"  || -z "$BACKUP_FILENAME" || \
      -z "$REMOTE_IP" || -z "$REMOTE_USERNAME" || -z "$REMOTE_PASSWORD" ]] ; then 
    echo -e "Usage: $0 \n 
    -d   <database_name>${SPACES:0:30}Database Name \n\
    -u   <username>${SPACES:0:35}Database Username \n\
    -p   <password>${SPACES:0:35}Database Password \n\
    -b   <backup_path>${SPACES:0:32}Backup Path in the local Server \n\
    -f   <backup_filename>${SPACES:0:28}Backup Filename \n\
    -i   <remote_ip>${SPACES:0:34}FTP server IP address or hostname \n\
    -O   <remote_port>${SPACES:0:32}FTP Server port number (default port number is 21) \n\
    -U   <remote_username>${SPACES:0:28}FTP Server Username \n\
    -P   <remote_password>${SPACES:0:28}FTP Server password"
    echo -e "\nError: Missing required parameters."
    exit 1
fi

mkdir -p /$BACKUP_PATH/$REMOTE_USERNAME/database
#mkdir -p /$BACKUP_PATH/$REMOTE_USERNAME/website

#mysqldump -u $USERNAME -p $PASSWORD -d $DATABASE_NAME > /$BACKUP_PATH/$REMOTE_USERNAME/database/$BACKUP_FILENAME.sql

#ftp -inv $ًٍREMOTE_IP $REMOTE_PORT <<EOF
#user $REMOTE_USERNAME $REMOTE_PASSWORD
#put $BACKUP_FILENAME
#bye
#EOF

#if [ $? -eq 0 ]; then
#    echo "File uploaded successfully."
#else
#    echo "File upload failed."
#fi


