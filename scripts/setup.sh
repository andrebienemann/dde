#!/bin/zsh

if [ $# -eq 0 ]; then
    printf "Would you like to set up Python? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-python
    fi

    printf "Would you like to set up Assembly? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-asm
    fi

    printf "Would you like to set up C? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-c
    fi

    printf "Would you like to set up CPP? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-cpp
    fi

    printf "Would you like to set up Node? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-node
    fi

    printf "Would you like to set up Go? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-go
    fi

    printf "Would you like to set up Docker? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-docker
    fi

    printf "Would you like to set up Buildx? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-buildx
    fi

    printf "Would you like to set up Kubectl? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-kubectl
    fi

    printf "Would you like to set up Helm? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-helm
    fi

    printf "Would you like to set up Terraform? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-terraform
    fi

    printf "Would you like to set up Packer? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-packer
    fi

    printf "Would you like to set up AWS CLI? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-aws
    fi

    printf "Would you like to set up SAM CLI? [Y/n] "; read opt
    if [[ $opt = "" ]] || [[ $opt = "y" ]] || [[ $opt = "Y" ]]; then
        setup-sam
    fi
else
    for arg in "$@"; do
        eval "setup-$arg"
    done
fi

exec zsh
