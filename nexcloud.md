# Nexcloud + collabora

## Install
echo 'deb https://www.collaboraoffice.com/repos/CollaboraOnline/CODE-ubuntu2004 ./' | sudo tee /etc/apt/sources.list.d/collabora.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0C54D189F4BA284D
apt update
apt install loolwsd code-brand

## SSL off
loolconfig set ssl.enable false
loolconfig set ssl.termination true
 
## Basic auth
sudo loolconfig set-admin-password

## Restart
systemctl restart loolwsd
systemctl status loolwsd

