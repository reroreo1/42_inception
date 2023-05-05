FROM debian:buster

EXPOSE 9000

RUN apt-get update && \
    apt-get install -y php7.3-fpm php7.3-mysql curl mariadb-client wget

COPY script.sh /tmp/setup.sh


CMD ["/bin/sh", "/tmp/setup.sh"]