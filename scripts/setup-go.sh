#!/bin/zsh

arch=$(dpkg --print-architecture)
version="$(curl https://go.dev/VERSION\?m\=text | grep go).linux-$arch.tar.gz"

wget -q "https://go.dev/dl/$version" 

tar -C /usr/local -xzf $version && rm $version
ln -sf /usr/local/go/bin/go /usr/local/bin/go

export GOPATH=/usr/local/etc/go

echo -e "\n export GOPATH=$GOPATH" >> ~/.bashrc
echo -e "\n export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
echo -e "\n export GOPATH=$GOPATH" >> ~/.zshrc
echo -e "\n export PATH=\$PATH:\$GOPATH/bin" >> ~/.zshrc

mkdir -p $GOPATH
