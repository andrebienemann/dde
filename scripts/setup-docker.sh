#!/bin/zsh

if [ -e "/var/run/docker.sock" ]; then
    apt install -yqq docker.io
else
    echo "Missing docker socket"
fi
