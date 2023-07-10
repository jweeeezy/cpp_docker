# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jwillert@student.42heilbronn.de            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/10 18:42:55 by jwillert          #+#    #+#              #
#    Updated: 2023/07/10 18:52:58 by jwillert         ###   ########           #
#                                                                              #
# **************************************************************************** #

.PHONY: all stop rm build run

all: stop rm build
stop:
	docker stop $(shell docker ps -a -q)
rm:
	docker rm $(shell docker ps -a -q)
	docker image rm $(shell docker images -a -q)
build:
	docker build . -t cpp
run:
	docker run -it cpp
