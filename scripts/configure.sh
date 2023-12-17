#!/bin/zsh

if [ $# -eq 0 ]; then
    printf "Would you like to configure time zone? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        configure-tz
    fi

    printf "Would you like to configure git? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        configure-git
    fi

    printf "Would you like to configure an ssh key? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        configure-ssh
    fi

    printf "Would you like to configure proxy? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        configure-proxy
    fi
else
    for arg in "$@"; do
        eval "configure-$arg"
    done
fi

exec zsh
