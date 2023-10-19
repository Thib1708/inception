# Version
FROM		debian:buster

# Install services
RUN		apt update			-y
RUN		apt upgrade			-y
RUN		apt-get install mariadb-server	-y

# MariaDB configuration
COPY		tool/mariadb_start.sh .
RUN		chmod +x mariadb_start.sh

# Open port
EXPOSE		3306

# Start
ENTRYPOINT	["./mariadb_start.sh"]
CMD		["mysqld", "--bind-address=0.0.0.0"]
