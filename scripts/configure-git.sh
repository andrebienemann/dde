#!/bin/zsh

printf "Enter your username: "; read username
printf "Enter your email: "; read email

git config --global user.name $username
git config --global user.email $email

git config --global init.defaultBranch main
git config --global pull.rebase false
