echo script by mert biber

echo now install required commands
apt install sudo

apt install unzip

echo now ca-certificates installation

sudo apt update

sudo apt install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2

apt update

sudo apt-get install -y php8.1 php8.1-gd php8.1-curl php8.1-zip php8.1-dom php8.1-xml php8.1-simplexml php8.1-mbstring php8.1-mysql

echo now database installation and configuration used mariadb

apt install mariadb-server mariadb-client -y

mysql -u root -e"CREATE USER ncadmin@127.0.0.1";

mysql -u root -e"CREATE DATABASE ncdb";

mysql -u root -e"GRANT ALL ON ncdb.* TO 'ncadmin'@'127.0.0.1' IDENTIFIED BY 'nextclouddbpw'";

mysql -u root -e"FLUSH PRIVILEGES";

echo now webserver installation used apache2

apt install apache2 -y

apt install libapache2-mod-php8.0

echo now download nextcloud version

cd /tmp

wget https://download.nextcloud.com/server/releases/latest.tar.bz2

tar -xf latest.tar.bz2

mv nextcloud /var/www/html

cd /var/www/html

sudo chown -R www-data:www-data nextcloud

sudo chmod -R 755 nextcloud

service apache2 restart

echo configure database on webinterface domain/nextcloud/index.php

echo script finished configure nextcloud on webinterface (domain/nextcloud)
