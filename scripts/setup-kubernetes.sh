#!/bin/zsh

if [ -e "/usr/local/share/kube/config" ]; then
    arch=$(dpkg --print-architecture)
    release=$(curl -L -s https://dl.k8s.io/release/stable.txt)
    
    curl -LO https://dl.k8s.io/release/$release/bin/linux/$arch/kubectl
    
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    rm kubectl && mkdir -p $HOME/.kube
    
    cp -r /usr/local/share/kube/* $HOME/.kube 2>/dev/null
    chown -R $(id -u) $HOME/.kube 2>/dev/null
else
    echo "Missing kube config"
fi
