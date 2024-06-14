#!/bin/bash
set -e
#Backs up remote database and copies to local
SERVER="24.144.88.70"
echo -e "\n>>> Backing up database on $SERVER."
TIME=$(date "+%s")
DBNAME="db.$TIME.sqlite3"
ssh root@$SERVER /bin/bash << EOF
set -e
mkdir -p /root/backups/
cp /app/db.sqlite3 /root/backups/$DBNAME

EOF

mkdir -p ~/backups/
scp root@$SERVER:/root/backups/* ~/backups/