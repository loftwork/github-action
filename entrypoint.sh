#!/bin/sh

# "to avoid continuing when errors or undefined variables are present"
set -eu

echo "Starting FTP Deploy"
echo "Uploading files..."

WDEFAULT_LOCAL_DIR=${LOCAL_DIR:-"."}
WDEFAULT_REMOTE_DIR=${REMOTE_DIR:-"."}

if [ $FTP_LOCAL_SERVER == "true" ]; then
    echo "LFTP LOCAL_SERVER -> PROD_SERVER..."

    #Entry LOCAL SERVER
    #$FTP_LOCAL_USERNAME、$FTP_LOCAL_PASSWORD

    #LOCAL SERVERからカレントへFTP

    #find関数で.htaccessとwp-configを削除

    #CurrentDir -> Production Server
else
    echo "LFTP LOCAL_DIR -> PROD_SERVER..."

    lftp $FTP_SERVER -u $FTP_USERNAME,$FTP_PASSWORD -e "set ftp:ssl-allow no; mirror -R $WDEFAULT_LOCAL_DIR $WDEFAULT_REMOTE_DIR; quit"

fi


echo "FTP Deploy Complete"
