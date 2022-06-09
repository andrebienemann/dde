FROM ubuntu

RUN apt update && apt -y upgrade

RUN apt install -y htop make git nano curl wget zsh

RUN chsh -s $(which zsh)

COPY setup.sh /usr/local/bin/setup
