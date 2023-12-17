#!/bin/zsh

if [ -e "/var/run/docker.sock" ]; then
    apt install -yqq docker.io

    arch=$(dpkg --print-architecture)
    release_url="https://api.github.com/repos/docker/buildx/releases/latest"
    tag=$(curl -s $release_url | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    binary="buildx-$tag.linux-$arch"

    wget https://github.com/docker/buildx/releases/download/$tag/$binary

    chmod a+x $binary
    mkdir -p ~/.docker/cli-plugins
    mv $binary ~/.docker/cli-plugins/docker-buildx
else
    echo "Missing docker socket"
fi
