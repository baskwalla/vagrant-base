#!/usr/bin/env bash

echo "--- Updating packages list ---"
apt-get update

echo "--- Installing Apache ---"
apt-get install -y apache2

echo "--- Setting document root ---"
sudo rm -rf /var/www/html
sudo ln -fs /vagrant/public /var/www/html

echo "--- Updating packages list ---"
sudo apt-get update

echo "--- Installing MySQL ---"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

echo "--- Installing base packages ---"
sudo apt-get install -y vim curl python-software-properties

echo "--- Updating packages list ---"
sudo apt-get update

# echo "--- Installing PHP 5.3.10 for Ubuntu 12.04 ---"
# sudo add-apt-repository -y ppa:rip84/php5
echo "--- Installing PHP 5.5 ---"
sudo add-apt-repository -y ppa:ondrej/php5

echo "--- Updating packages list ---"
sudo apt-get update

echo "--- Installing PHP-specific packages ---"
sudo apt-get install -y libapache2-mod-php5 php5-curl php5-gd php5-mcrypt mysql-server-5.5 php5-mysql git-core

echo "--- Enabling mod-rewrite ---"
sudo a2enmod rewrite

echo "--- Restarting Apache ---"
sudo service apache2 restart

echo "--- Installing Composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "--- Installing Node ---"
apt-get update -y

apt-get install make -y  
apt-get install build-essential -y  
apt-get install openssl -y  
apt-get install libssl-dev -y  
apt-get install pkg-config -y

wget http://nodejs.org/dist/v0.10.25/node-v0.10.25.tar.gz

tar -zxf node-v0.10.25.tar.gz  
cd node-v0.10.25  
./configure
make  
sudo make install