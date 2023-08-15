# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jwillert <jwillert@student.42heilbronn.de> +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/10 18:42:55 by jwillert          #+#    #+#              #
#    Updated: 2023/08/15 13:53:56 by jwillert         ###   ########           #
#                                                                              #
# **************************************************************************** #

.PHONY: all stop rm build run

all: build
stop:
	docker stop $(shell docker ps -a -q)
rm:
	docker rm $(shell docker ps -a -q)
	docker image rm $(shell docker images -a -q)
build:
	git submodule foreach git pull
	docker build . -t cpp
run:
	docker run -it cpp
re: stop rm build
