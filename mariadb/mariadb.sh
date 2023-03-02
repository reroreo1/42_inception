#!/bin/sh

/etc/init.d/mariadb setup 
/etc/init.d/mariadb start 
mariadb -e "CREATE DATABASE wordpress" 
mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'rezzahra'@'localhost' IDENTIFIED BY '12345678'; " 
mariadb -e "FLUSH PRIVILEGES"
/etc/init.d/mariadb stop

exec $@