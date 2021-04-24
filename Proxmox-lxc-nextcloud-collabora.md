
# Proxmox

# Update the server & install LAMP, APCu, Redis

```
sudo apt update && sudo apt upgrade
```

## Install LAMP
```
sudo apt install lamp-server^
```
## Meta-packages
L'utilisation du ^ dans le nom du paquet est importante car elle permet d'installer un ensemble de paquets courament instalés ensemble.
Cela permet d'installer Apache, MySQL et PHP avec les modules nécessaires.

* Pour mysql, ne pas oublier 
```
sudo mysql_secure_installation
```

## APCU et Redis
```
sudo apt install php-apcu redis-server php-redis
```

## Paquets nécessaire à NextCloud
```
sudo apt install php-zip php-dompdf php-xml php-mbstring php-gd php-curl unzip
sudo apt install php-intl php-bcmath php-gmp php-imagick imagemagick
```

## Modules Apache
```
sudo a2enmod rewrite headers env dir mime
```

Restart histoire de vérifier
```
sudo service apache2 restart
```



# SSL
* Tutoriel suivi : [https://doc.ubuntu-fr.org/tutoriel/securiser_apache2_avec_ssl]

## renouvellement :
```
sudo crontab -e
```

@todo


# Nextcloud
Pour des raisons de simplicité, Nextcloud sera installé directement dans /var/www/html.
Attention à la version, ici la dernière était la 21.0.1.
```
cd /var/www
sudo wget https://download.nextcloud.com/server/releases/nextcloud-21.0.1.zip
sudo unzip nextcloud-21.0.1.zip
sudo mv html html.old
sudo mv nextcloud html
```
NB : Le répertoire html peux bien évidement être supprimé.

## Droits
```
sudo chown -R www-data:www-data /var/www/html/nextcloud
```

## Base mysql
```
mysql -u root -p
```
```
CREATE DATABASE nextcloud;
CREATE USER 'ncuser'@'localhost' IDENTIFIED BY 'ncpassword';
GRANT ALL PRIVILEGES ON nextcloud . * TO 'ncuser'@'localhost';
```

## Data dir
Le déplacement du répertoire sera effectué plus tard.

## Apache
Simple restart, installation dans /var/wwww/html
```
sudo systemctl restart apache2
```

## Installation
Aller avec votre navigateur sur l'url de votre installation : http://mon-cloud.perso/ et suivez les instructions.

Attention, un répertoire DATA dans le webroot n'est pas vraiment conseillé sauf si vous avez configuré votre .htaccess en conséquences. Le mieux est de le créer en dehors.
Exemple :
```
sudo mkdir /nextcloud-data
sudo chown -R www-data:www-data /nextcloud-data
```

Utiliser ce répertoire lors de l'installation.

## .htaccess
@vérifier
Si soucis accès :

```
sudo vim /etc/apache2/apache2.conf
```

Modifier (AllowOverride) :
```Apache
<Directory /var/www/>        
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
</Directory>
```
En :
```Apache
<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>
```

Relancer
```
sudo service apache2 restart
```


# Le cache :

```
sudo vim /etc/redis/redis.conf
```


systemctl restart apache2

systemctl enable redis-server


## Ajout du cache dans la conf. netxcloud
```
sudo vim /var/www/html/config/config.php
```

```php
'memcache.local' => '\\OC\\Memcache\\Redis',
'memcache.locking' => '\\OC\\Memcache\\Redis',
'filelocking.enabled' => 'true',
'redis' => 
array (
  'host' => '/var/run/redis/redis-server.sock',
  'port' => 0,
  'timeout' => 0.0,
),
```

```
systemctl restart redis-server
```


## Pretty-links
On peut également supprimer l'index.php qui est dans chaque url :
```
sudo vim /var/www/html/config/config.php
```

Ajouter 'htaccess.RewriteBase' => '/', (modifier en fonction de votre installation, ici directement dans /. Si vous avez installé dans un répertoire et accéder à nextcloud via : mon-domain/repertoire, vous devez mettre "/repertoire").

### Mettre à jour le .htaccess
Allez dans le répertoire d'installation
```
cd /var/www/html
sudo -u www-data php occ maintenance:update:htaccess
```

## Upload
Modifier le 'php.ini'.
```
sudo vi /etc/php/7.4/apache2/php.ini
```

```
upload_max_filesize = 2048M
post_max_size = 2058M
```

Relancer apache
```
systemctl restart apache2
```

Aller ensuite dans l'administration Nextcloud /Sytème et vérifiez que l'upload size correspond à ce que vous avez mis.



```
```

# Sources
* https://bayton.org/docs/nextcloud/installing-nextcloud-on-ubuntu-16-04-lts-with-redis-apcu-ssl-apache/
* https://www.collaboraoffice.com/code/linux-packages/
* https://doc.ubuntu-fr.org/tutoriel/securiser_apache2_avec_ssl
