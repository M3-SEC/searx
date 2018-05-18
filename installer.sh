#!/bin/bash

sudo chmod +x searx.sh
cd
"" >> .bashrc
echo "alias searx='bash ~/searx/searx.sh'" >> .bashrc
touch .bashrc
clear
sudo apt-get install git build-essential libxslt-dev python-dev python-virtualenv python-babel zlib1g-dev libffi-dev libssl-dev -y
cd /usr/local
sudo git clone https://github.com/asciimoo/searx.git
sudo useradd searx -d /usr/local/searx
sudo chown searx:searx -R /usr/local/searx
cd /usr/local/searx
virtualenv searx-ve
. ./searx-ve/bin/activate
./manage.sh update_packages
sed -i -e "s/ultrasecretkey/`openssl rand -hex 16`/g" searx/settings.yml
clear
echo "Everything done! To use the tool run ./searx.sh"