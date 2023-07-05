FROM ubuntu:latest

RUN apt-get update -y && apt-get install -y

RUN apt-get install clang -y

COPY . /usr/src/cpp_test

WORKDIR /usr/src/cpp_test

RUN c++ -o Test main.cpp -std=c++98 -Wall -Wextra -Werror

CMD [ " ./Test " ]