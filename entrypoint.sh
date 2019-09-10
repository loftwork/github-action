#!/bin/sh

# "to avoid continuing when errors or undefined variables are present"
set -eu

echo "Starting GIT-FTP Deploy"
echo "Uploading files..."

echo "master branch -> PROD_SERVER..."
set +e

echo "FTP_DEST=${FTP_DEST} FTP_USER=${FTP_USER} FTP_PWD=${FTP_PWD}"
if [ $KEY != "" ]; then
    echo $KEY > ./id_rsa
fi

git config git-ftp.url "sftp://ftp-test.loftwork.work/var/www/vhosts/ftp-test/"

git config git-ftp.user $FTP_USER
#git config git-ftp.password $FTP_PWD
git config git-ftp.key ./id_rsa

    git ftp init
    exit_code=$?
    if [ "$exit_code" -ne 0 ]; then
        git ftp push
    fi

echo "FTP Deploy Complete"
