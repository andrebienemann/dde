#!/bin/zsh

printf "Enter your time zone: "; read tz

echo -e "\nexport TZ=$tz" >> ~/.bashrc
echo -e "\nexport TZ=$tz" >> ~/.zshrc
