#!/bin/bash
#Install Django app on server.
set -e
SERVER="24.144.88.70"
echo -e "\n>>> Installing Django project files on server."

ssh root@$SERVER /bin/bash << EOF
set -e
echo -e "\n>>> Stopping Gunicorn"
cd /app/
. env/bin/activate
./scripts/super.sh stop gunicorn


echo -e "\n>>> Deleting Old files"
rm -rf /app/ElevateTanning
rm -rf /app/config
rm -rf /app/scripts
rm requirements.txt

echo -e "\n>>> Copying New files"
cp -r /root/deploy/ElevateTanning /app/
cp -r /root/deploy/config /app/
cp -r /root/deploy/scripts /app/
cp /root/deploy/requirements.txt /app/

echo -e "\n>>> Installing Python Packages"
pip install -r /app/requirements.txt

echo -e "\n>>> Running Django Migrations"
pushd ElevateTanning
./manage.py migrate

echo -e "\n>>> Collecting static files"
./manage.py collectstatic
popd

echo -e "\n>>> Re-reading Supervisord Config"
./scripts/super.sh reread


echo -e "\n>>> Starting Gunicorn"
./scripts/super.sh start gunicorn

EOF

echo -e "\n>>> Finished Installing Django project files on server."