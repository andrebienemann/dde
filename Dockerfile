FROM ubuntu

RUN apt update && apt -y upgrade

RUN apt install -y nano htop curl make zsh git apt software-properties-common gnupg

RUN chsh -s $(which zsh)
