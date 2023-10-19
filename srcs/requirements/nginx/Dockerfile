# Version
FROM debian:buster

# Install services
RUN apt-get update && apt-get install -y nginx openssl

# Open port
EXPOSE 443

# Copy data
COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf
COPY ./tool/nginx_start.sh /var/www


# Nginx installation
RUN chmod +x /var/www/nginx_start.sh

ENTRYPOINT [ "/var/www/nginx_start.sh" ]

CMD ["nginx", "-g", "daemon off;"]
