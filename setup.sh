#!/bin/bash

# INSTALL C/C++

printf "Would you like to install gcc? [Y/n] "
read opt
if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
    apt install -y gcc
fi

# INSTALL PYTHON

printf "Would you like to install Python? [Y/n] "
read opt
if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
    apt install -y python3 virtualenv
fi

# INSTALL NODE.JS

printf "Would you like to install Node.js? [Y/n] "
read opt
if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
    curl -sL https://deb.nodesource.com/setup_14.x | bash -
    apt install -y nodejs
fi

# INSTALL TERRAFORM

printf "Would you like to install Terraform? [Y/n] "
read opt
if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    apt update && apt install terraform
fi

# INSTALL DOCKER

printf "Would you like to install Docker? [Y/n] "
read opt
if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
    apt install -y docker.io
fi

# CONFIGURE GIT

printf "Would you like to configure git? [Y/n] "
read opt
if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
    printf "Enter your username: "
    read username
    git config --global user.name $username
    printf "Enter your email: "
    read email
    git config --global user.email $email
fi

# CREATE AN SSH KEY

printf "Would you like to create an ssh key? [Y/n] "
read opt
if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
    ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa
fi

# CONFIGURE ZSH

printf "Would you like to auto configure zsh? [Y/n] "
read opt
if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
