#!/bin/bash

# install mysql
sudo apt update -y
sudo apt install mysql-server -y
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo service mysql restart

# create symlink for python
sudo ln -s /usr/bin/python3 /usr/bin/python

# configure mysql
mysql -u root <<'EOF'
ALTER USER 'root'@'localhost' IDENTIFIED BY 'AWSRocksSince2006';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
CREATE USER 'wordpress-user' IDENTIFIED BY 'AWSRocksSince2006';
CREATE DATABASE `wordpress-db`;
GRANT ALL PRIVILEGES ON `wordpress-db`.* TO "wordpress-user";
FLUSH PRIVILEGES;
EOF