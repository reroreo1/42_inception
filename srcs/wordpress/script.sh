wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir -p /var/www && cd /var/www
wp core download --allow-root
wp core config --dbhost=mariadb --dbname=wordpress --dbuser=moderator --dbpass=root123 --allow-root
chmod 600 wp-config.php
wp core install --url=localhost --title=myBlog --admin_name=shark --admin_password=root123 --admin_email=rachidentre1@gmail.com --allow-root
wp user create moderator rachid2pc1@gmail.com --role=author --user_pass=root123 --allow-root
service php7.3-fpm start # for creating config directory
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
service php7.3-fpm stop 
php-fpm7.3 -F -R

