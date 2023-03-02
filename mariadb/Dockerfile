FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server

EXPOSE 3306

# Set the default command to start the MariaDB server
ENTRYPOINT ["/usr/bin/mysqld_safe"]

# Set default options for mysqld_safe
CMD ["--datadir=/var/lib/mysql", "--socket=/var/run/mysqld/mysqld.sock"]