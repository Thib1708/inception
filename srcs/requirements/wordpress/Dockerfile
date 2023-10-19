# Version
FROM		debian:buster

# Install services
RUN		apt-get update
RUN		apt-get upgrade
RUN		apt-get -y install wget
RUN		apt-get install -y php7.3 php-fpm php-mysqli mariadb-client wget curl

# Open port
EXPOSE		9000

# Copy data
COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY		./tools /var/www/

# Wordpress installation
RUN		chmod +x /var/www/auto_install.sh		

# Start WordPress
ENTRYPOINT	["/var/www/auto_install.sh"]
CMD		["/usr/sbin/php-fpm7.3", "--nodaemonize"]
