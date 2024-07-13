#!/bin/zsh

arch=$(dpkg --print-architecture)

archive=eksctl_Linux_$arch.tar.gz

wget -q https://github.com/eksctl-io/eksctl/releases/latest/download/$archive -O /tmp/$archive

tar -xzf /tmp/$archive -C /tmp && mv /tmp/eksctl /usr/local/bin

rm /tmp/$archive
