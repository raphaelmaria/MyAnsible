#!/bin/sh

# [Instalacao do Anydesk]
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee -a /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt --fix-broken install -y
sudo apt -y install anydesk
sudo wget http://ftp.us.debian.org/debian/pool/main/p/pangox-compat/libpangox-1.0-0_0.0.2-5.1_amd64.deb
sudo apt -y install ./libpangox-1.0-0_0.0.2-5.1_amd64.deb
sudo apt --fix-broken install -y
sudo systemctl enable --now anydesk.service