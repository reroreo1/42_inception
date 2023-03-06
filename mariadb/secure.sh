#!/bin/bash
service mysql start
mysql --user=root <<_EOF_
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE IF NOT EXISTS WORDPRESS_DB;
CREATE USER IF NOT EXISTS 'moderator'@'localhost' IDENTIFIED BY 'root123';
GRANT ALL PRIVILEGES ON WORDPRESS_DB.* TO 'moderator'@'%';
FLUSH PRIVILEGES;
_EOF_
