# Utiliser l'image de Debian Buster comme base
FROM debian:buster

# Mettre à jour les packages de l'image de base
RUN apt-get update && apt-get upgrade -y

# Installer NGINX et OpenSSL
RUN apt-get install -y nginx

# Copier le fichier de configuration personnalisé pour Nginx
# COPY nginx.conf /etc/nginx/nginx.conf

# Définir les protocoles TLS acceptés dans la configuration de NGINX
RUN sed -i -e '/ssl_protocols/c\    ssl_protocols TLSv1.2 TLSv1.3;' /etc/nginx/nginx.conf

# Exposer les ports nécessaires pour NGINX
EXPOSE 80

# Démarrer NGINX
CMD ["nginx", "-g", "daemon off;"]