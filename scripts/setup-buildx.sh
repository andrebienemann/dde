#!/bin/zsh

if [ -e "/var/run/docker.sock" ]; then
    arch=$(dpkg --print-architecture)
    release_url="https://api.github.com/repos/docker/buildx/releases/latest"
    tag=$(curl -s $release_url | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    binary="buildx-$tag.linux-$arch"

    wget -q https://github.com/docker/buildx/releases/download/$tag/$binary -O /tmp/$binary

    chmod a+x /tmp/$binary
    mkdir -p ~/.docker/cli-plugins
    mv /tmp/$binary ~/.docker/cli-plugins/docker-buildx
else
    echo "Missing docker socket"
fi
