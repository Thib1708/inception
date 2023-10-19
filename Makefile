# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thibaultgiraudon <thibaultgiraudon@stud    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/18 19:45:06 by thibaultgir       #+#    #+#              #
#    Updated: 2023/10/18 19:45:11 by thibaultgir      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up

up:
	@mkdir -p ${HOME}/data
	@mkdir -p ${HOME}/data/wordpress
	@mkdir -p ${HOME}/data/mariadb
	@sudo sh -c 'echo "127.0.0.1 tgiraudo.42.fr" >> /etc/hosts && echo "successfully added tgiraudo.42.fr to /etc/hosts"'
	@docker compose -f ./srcs/docker-compose.yml up --detach

down:
	@docker compose -f ./srcs/docker-compose.yml down

build:
	@docker compose -f srcs/docker-compose.yml up --detach --build

logs:
	@docker compose -f srcs/docker-compose.yml logs

clean:
	@docker stop nginx wordpress mariadb 2>/dev/null || true
	@docker rm nginx wordpress mariadb 2>/dev/null || true
	@docker volume rm db wp 2>/dev/null || true
	@docker rmi srcs-nginx srcs-wordpress srcs-mariadb 2>/dev/null || true
	@docker network rm inception_net 2>/dev/null || true
	sudo rm -rf ${HOME}/data
	@sudo sed -i '/127.0.0.1 tgiraudo.42.fr/d' /etc/hosts && echo "successfully removed tgiraudo.42.fr to /etc/hosts"
	# @docker system prune --all # remove comment will remove every cached docker data 

purge:	down clean
	@docker system prune --all

re: clean all

.PHONY: all up down build clean logs re
