#!/bin/zsh

arch=$(dpkg --print-architecture)
index=$(curl -sL https://releases.hashicorp.com/packer/index.json)
url="$(echo $index | jq -r ".versions[].builds[].url" | egrep -v "rc|beta|alpha" | egrep "linux.*$arch" | tail -1)"

wget -q $url && unzip -oq ${url##*/} -d /usr/local/packer && rm ${url##*/}
ln -sf /usr/local/packer/packer /usr/local/bin/packer
