#!/bin/zsh

arch=$(dpkg --print-architecture)
version="$(curl https://go.dev/VERSION\?m\=text | grep go).linux-$arch.tar.gz"

wget -q "https://go.dev/dl/$version" -O /tmp/$version

tar -C /usr/local -xzf /tmp/$version && rm /tmp/$version
ln -sf /usr/local/go/bin/go /usr/local/bin/go

export GOPATH=/usr/local/etc/go

echo -e "\nexport GOPATH=$GOPATH" >> ~/.bashrc
echo -e "\nexport PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
echo -e "\nexport GOPATH=$GOPATH" >> ~/.zshrc
echo -e "\nexport PATH=\$PATH:\$GOPATH/bin" >> ~/.zshrc

mkdir -p $GOPATH
