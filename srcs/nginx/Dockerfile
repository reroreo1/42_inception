FROM debian:buster

# Install Nginx and OpenSSL
RUN apt-get update && apt-get install -y nginx openssl

# Generate self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/nginx.key -out /etc/nginx/nginx.crt \
    -subj "/C=US/ST=California/L=San Francisco/O=My Company/CN=mydomain.com"

RUN mkdir -p /home/rezzahra/data/wordpress

# Configure Nginx to use SSL
COPY nginx.conf /etc/nginx/conf.d

# Expose port 443 for HTTPS traffic
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
