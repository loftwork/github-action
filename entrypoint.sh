#!/bin/sh

# "to avoid continuing when errors or undefined variables are present"
set -eu

echo "Starting GIT-FTP Deploy"
echo "Uploading files..."

echo "master branch -> PROD_SERVER..."
set +e

echo "FTP_DEST=${FTP_DEST} FTP_USER=${FTP_USER} FTP_PWD=${FTP_PWD}"

#git config git-ftp.url "ftpes://ftp-test.loftwork.work/"

git config git-ftp.url $FTP_DEST
git config git-ftp.user $FTP_USER
git config git-ftp.password $FTP_PWD

    # git ftp -vv init
    # exit_code=$?
    # if [ "$exit_code" -ne 0 ]; then
        git ftp -vv push
    # fi

echo "FTP Deploy Complete"
