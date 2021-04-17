# Nexcloud + collabora

## Install
```
echo 'deb https://www.collaboraoffice.com/repos/CollaboraOnline/CODE-ubuntu2004 ./' | sudo tee /etc/apt/sources.list.d/collabora.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0C54D189F4BA284D
apt update
apt install loolwsd code-brand
```

## SSL off
```
loolconfig set ssl.enable false
loolconfig set ssl.termination true
```

## Basic auth
```
sudo loolconfig set-admin-password
```

## Restart
```
systemctl restart loolwsd
systemctl status loolwsd
```

## links
https://www.collaboraoffice.com/code/linux-packages/
https://www.sandyscott.net/2020/05/24/server-setup-12-collabora/
https://www.linuxbabe.com/ubuntu/integrate-collabora-onlinenextcloud-without-docker


## Change dir
```
sudo cd /var/snap/nextcloud/common
sudo mv nexcloud/data nexcloud/data.orig
sudo mkdir nexcloud/data
sudo mount /dev/sdX nexcloud/data
```

## Récupérer infos /etc/mtab, les ajouter à /etc/fstab
```
# /etc/fstab: static file system information.
# 
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/ubuntu-vg/ubuntu-lv during curtin installation
/dev/disk/by-id/dm-uuid-LVM-C3JwpCxre8ui1OfyclieLcA3SkYfXCenDzdVqTiCrXETgxuhY3U6kxFEE91Xj7iQ / ext4 defaults 0 0
# /boot was on /dev/sda2 during curtin installation
/dev/disk/by-uuid/b190dbe6-4d3c-46ab-97d5-7581dcfa29b2 /boot ext4 defaults 0 0
/swap.img       none    swap    sw      0       0
/dev/sdb /var/snap/nextcloud/common/nextcloud/data ext4 rw,relatime 0 0
```

