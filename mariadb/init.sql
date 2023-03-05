CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY 'wordpress_password';
INSERT INTO wp_users (user_login, user_pass, user_nicename, user_email, user_registered, user_status) VALUES ('user1', MD5('password1'), 'user1', 'user1@example.com', NOW(), 0);
INSERT INTO wp_users (user_login, user_pass, user_nicename, user_email, user_registered, user_status) VALUES ('admin', MD5('password2'), 'admin', 'admin@example.com', NOW(), 0);