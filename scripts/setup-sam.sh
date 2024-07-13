#!/bin/zsh

arch=$(dpkg --print-architecture)

if [[ $arch = "amd64" ]]; then
    wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip -O /tmp/aws-sam-cli.zip
elif [[ $arch = "arm64" ]]; then
    wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-arm64.zip -O /tmp/aws-sam-cli.zip
fi

unzip /tmp/aws-sam-cli.zip -d /tmp/aws-sam-cli && /tmp/aws-sam-cli/install --update

rm -r /tmp/aws-sam-cli /tmp/aws-sam-cli.zip
