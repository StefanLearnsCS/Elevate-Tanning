#!/bin/bash
set -e
SERVER="24.144.88.70"
echo -e "\n>>> Copying Django project files to server."

echo -e "\n>>> Preparing scripts locally."
rm -rf deploy
mkdir deploy
cp -r config deploy
cp -r scripts deploy
cp -r ElevateTanning deploy
cp requirements.txt deploy

echo -e "\n>>> Copying files to the server."
ssh root@$SERVER "rm -rf /root/deploy/"
scp -r deploy root@$SERVER:/root/

echo -e "\n>>> Cleaning up deployed files to the server."
ssh root@$SERVER /bin/bash << EOF
    set -e
    find /root/deploy/ -name *.pyc -delete
    find /root/deploy/ -name __pycache__ -delete
    find /root/deploy/ -type f -print0 | xargs -0 dos2unix
EOF

echo -e "\n>>> Finished Copying Django project files to server."
