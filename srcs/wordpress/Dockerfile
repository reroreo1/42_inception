FROM debian:buster

EXPOSE 9000

RUN apt-get update && \
    apt-get install -y php7.3-fpm php7.3-mysql curl mariadb-client wget && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY script.sh /usr/bin/setup

RUN chmod +x /usr/bin/setup

ENTRYPOINT ["setup"]

CMD [ "php-fpm7.3", "-F", "-R" ]