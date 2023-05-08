#!/bin/bash
mkdir -p /home/rezzahra/data/wordpress && cd /home/rezzahra/data/wordpress
rm -rf *
chown -R www-data /home/rezzahra/data/wordpress
wp core download --allow-root
wp core config --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --allow-root
chmod 600 wp-config.php
wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_name=${ADMIN} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL} --allow-root
wp user create ${USER_NAME} ${USER_EMAIL} --role=${ROLE} --user_pass=${USER_PASS} --allow-root
chown -R www-data:www-data /home/rezzahra/data/wordpress
service php7.3-fpm start # for creating config directory
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
service php7.3-fpm stop
exec $@

