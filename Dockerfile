FROM debian:bookworm as base

RUN apt update && apt -y upgrade
RUN apt install -y ca-certificates cntlm
RUN apt install -y curl wget jq zip unzip
RUN apt install -y make git vim nano man
RUN apt install -y htop

FROM base AS zsh

RUN apt install -y zsh
RUN chsh -s $(which zsh)
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

FROM zsh AS scripts

SHELL ["/bin/bash", "-c"]

RUN mkdir /usr/local/etc/scripts
RUN echo -e "\nexport PATH=\$PATH:/usr/local/etc/scripts" >> ~/.bashrc
RUN echo -e "\nexport PATH=\$PATH:/usr/local/etc/scripts" >> ~/.zshrc

COPY scripts/configure-git.sh /usr/local/etc/scripts/configure-git
COPY scripts/configure-proxy.sh /usr/local/etc/scripts/configure-proxy
COPY scripts/configure-ssh.sh /usr/local/etc/scripts/configure-ssh
COPY scripts/configure-tz.sh /usr/local/etc/scripts/configure-tz
COPY scripts/configure.sh /usr/local/etc/scripts/configure

COPY scripts/setup-asm.sh /usr/local/etc/scripts/setup-asm
COPY scripts/setup-aws.sh /usr/local/etc/scripts/setup-aws
COPY scripts/setup-c.sh /usr/local/etc/scripts/setup-c
COPY scripts/setup-cpp.sh /usr/local/etc/scripts/setup-cpp
COPY scripts/setup-docker.sh /usr/local/etc/scripts/setup-docker
COPY scripts/setup-go.sh /usr/local/etc/scripts/setup-go
COPY scripts/setup-helm.sh /usr/local/etc/scripts/setup-helm
COPY scripts/setup-kubernetes.sh /usr/local/etc/scripts/setup-kubernetes
COPY scripts/setup-node.sh /usr/local/etc/scripts/setup-node
COPY scripts/setup-packer.sh /usr/local/etc/scripts/setup-packer
COPY scripts/setup-python.sh /usr/local/etc/scripts/setup-python
COPY scripts/setup-terraform.sh /usr/local/etc/scripts/setup-terraform
COPY scripts/setup.sh /usr/local/etc/scripts/setup

FROM scripts AS final

WORKDIR /root
