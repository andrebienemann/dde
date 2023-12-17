#!/bin/zsh

arch=$(dpkg --print-architecture)

if [[ $arch = "amd64" ]]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o /tmp/awscliv.zip
elif [[ $arch = "arm64" ]]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o /tmp/awscliv.zip
fi

unzip -qq /tmp/awscliv.zip -d /tmp && /tmp/aws/install --update
rm /tmp/awscliv.zip && rm -r /tmp/aws
