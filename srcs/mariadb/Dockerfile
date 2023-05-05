FROM debian:buster

RUN apt-get update && apt-get install mariadb-server mariadb-client -y

COPY ./script.sql /tmp/

RUN service mysql start && mysql -uroot < /tmp/script.sql

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT  ["mysqld"]