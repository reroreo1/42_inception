create database if not exists wordpress;
create user if not exists 'moderator'@'%' identified by 'root123';
grant all privileges on wordpress.* to 'moderator'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';
FLUSH PRIVILEGES;