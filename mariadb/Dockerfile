FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server

COPY secure.sh .

ENTRYPOINT [ "bash" , "secure.sh"]

EXPOSE 3306

CMD [ "mysqld" ]




