FROM ubuntu:latest

# Update all ubuntu programs
RUN apt-get update -y && apt-get install -y

# Install SSH-Client and copy ssh-key from current directory
RUN apt-get install openssh-client -y
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# Install Git and set configurations
RUN apt-get update && apt-get install git -y
RUN git config --global user.name "jwillert" \
	&& git config --global user.email "jwillert@student.42heilbronn.de"

# Install clang compiler for C++
RUN apt-get update && apt-get install clang -y

# Install make
RUN apt-get update && apt-get install make -y

# Install vim
RUN apt-get update && apt-get install vim -y

RUN apt-get upgrade -y

# Set working directory and git clone current repo
WORKDIR /usr/src/
COPY cpp/ /usr/src/cpp/
RUN cd /usr/src/cpp/cpp_00/

#RUN clang++ -o Test main.cpp -std=c++98 -Wall -Wextra -Werror
