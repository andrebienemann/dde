#!/bin/zsh

arch=$(dpkg --print-architecture)
index=$(curl -sL https://releases.hashicorp.com/terraform/index.json)
url="$(echo $index | jq -r ".versions[].builds[].url" | egrep -v "rc|beta|alpha" | egrep "linux.*$arch" | tail -1)"

wget -q $url && unzip -oq ${url##*/} -d /usr/local/terraform && rm ${url##*/}
ln -sf /usr/local/terraform/terraform /usr/local/bin/terraform
