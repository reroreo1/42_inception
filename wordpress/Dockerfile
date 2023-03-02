FROM debian:buster
# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    mariadb-client \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-xmlrpc \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html/wordpress
# Download and extract latest version of WordPress
RUN curl -o /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -C /var/www/html -zxvf /tmp/latest.tar.gz && \
    rm /tmp/latest.tar.gz && \
    chown -R www-data:www-data /var/www/html/wordpress

# Configure PHP-FPM
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini && \
    echo "listen = /run/php/php7.3-fpm.sock" >> /etc/php/7.3/fpm/pool.d/www.conf && \
    echo "listen.owner = www-data" >> /etc/php/7.3/fpm/pool.d/www.conf && \
    echo "listen.group = www-data" >> /etc/php/7.3/fpm/pool.d/www.conf && \
    echo "listen.mode = 0660" >> /etc/php/7.3/fpm/pool.d/www.conf

# Set up a volume for WordPress data
VOLUME /var/www/html/wordpress
# Expose the port for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.3", "-F"]