#!/bin/bash

sudo apt-get update -y
sudo apt install apache2 php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip nmap unzip mysql-client-core-5.7 -y
wget https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/scripts/apache_config.cnf
sudo cp ./apache_config.cnf /etc/apache2/sites-available/000-default.conf
sudo rm /var/www/html/index.html
sudo a2enmod rewrite
sudo systemctl restart apache2

# fix privs, we're making it super broad open
sudo usermod -a -G www-data ubuntu
sudo chmod 2775 /var/www
sudo chown -R ubuntu:www-data /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

# create symlink for python
sudo ln -s /usr/bin/python3 /usr/bin/python

# wordpress
cd ~
wget https://wordpress.org/wordpress-5.1.1.tar.gz
tar -xzf wordpress-5.1.1.tar.gz
rm wordpress-5.1.1.tar.gz

cp wordpress/wp-config-sample.php wordpress/wp-config.php
sed -i 's/database_name_here/wordpress-db/g' wordpress/wp-config.php
sed -i 's/username_here/wordpress-user/g' wordpress/wp-config.php
sed -i 's/password_here/AWSRocksSince2006/g' wordpress/wp-config.php
sed -i "s/localhost/${DB_IP}/g" wordpress/wp-config.php

# deploy woocoomerce
cd ~/wordpress/wp-content/plugins/
wget https://downloads.wordpress.org/plugin/woocommerce.3.5.4.zip
unzip ./woocommerce.3.5.4.zip
rm ./woocommerce.3.5.4.zip

# deploy uploads
cd ~/wordpress/wp-content/
wget https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/scripts/uploads.zip
unzip ./uploads.zip
rm ./uploads.zip

# configure mysql
wget https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/scripts/db_import.sql
# update server name
sed -i "s/SERVER_NAME/${WEBSERVER_DOMAIN_NAME}/g" ./db_import.sql
# import file into the mysql
mysql -u wordpress-user -pAWSRocksSince2006 -h $DB_IP -D wordpress-db < ./db_import.sql
rm ./db_import.sql

# copy everything to www/html
cd ~
cp -r wordpress/* /var/www/html/