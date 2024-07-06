#!/bin/zsh

arch=$(dpkg --print-architecture)
index=$(curl -sL https://releases.hashicorp.com/packer/index.json)
url="$(echo $index | jq -r ".versions[].builds[].url" | egrep -v "rc|beta|alpha" | egrep "linux.*$arch" | tail -1)"

wget -q $url -O /tmp/packer
unzip -oq /tmp/packer -d /usr/local/packer && rm /tmp/packer
ln -sf /usr/local/packer/packer /usr/local/bin/packer
