# Dockerised Development Environment

[![Docker Hub](https://img.shields.io/docker/stars/andrebienemann/dde.svg)](https://hub.docker.com/r/andrebienemann/dde)
[![Docker Hub](https://img.shields.io/docker/pulls/andrebienemann/dde.svg)](https://hub.docker.com/r/andrebienemann/dde)
[![Docker Hub](https://img.shields.io/docker/image-size/andrebienemann/dde.svg)](https://hub.docker.com/r/andrebienemann/dde)

DDE is a development environment inside of a Docker container.

It serves as a swift method for setting up lightweight, ephemeral development environments.

Built upon a Debian image, it includes supplementary software to enhance its functionality:
  - shell ([bash](https://www.gnu.org/software/bash/), [zsh](https://www.zsh.org/))
  - data transfer ([curl](https://curl.se/), [wget](https://www.gnu.org/software/wget/))
  - archiving ([tar](https://www.gnu.org/software/tar/), [zip](https://linux.die.net/man/1/zip), [unzip](https://linux.die.net/man/1/unzip))
  - package management ([apt](https://wiki.debian.org/Apt))
  - code editing ([nano](https://nano-editor.org/), [vim](https://www.vim.org/))
  - stream processing ([grep](https://www.gnu.org/software/grep/manual/grep.html), [sed](https://www.gnu.org/software/sed/manual/sed.html), [jq](https://stedolan.github.io/jq/))
  - system monitoring ([htop](https://htop.dev/))
  - build automation ([make](https://www.gnu.org/software/make/))
  - version control ([git](https://git-scm.com/))
  - proxy ([cntlm](https://cntlm.sourceforge.net/))

For convenience, it guides developers through:
  - environment configuration ([git](https://git-scm.com/), [proxy](https://cntlm.sourceforge.net/), [ssh](https://linux.die.net/man/1/ssh-keygen), [tz](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones))
  - installation of compilers, runtimes and interpreters ([go](https://go.dev/), [gcc](https://gcc.gnu.org/), [node](https://nodejs.org/en/), [python](https://www.python.org/))
  - installation of container and cloud tools ([docker](https://www.docker.com/), [kubernetes](https://kubernetes.io/), [helm](https://helm.sh/), [terraform](https://www.terraform.io/), [packer](https://www.packer.io/), [aws cli](https://awscli.amazonaws.com/v2/documentation/api/latest/index.html))

## Quick Start

Create your development environment by executing the command provided below.

```txt
docker run --tty --detach --name <name> andrebienemann/dde
```

## Enabling Docker

To enable Docker client inside of your container, you will need to mount Docker's socket.

```txt
--volume /var/run/docker.sock:/var/run/docker.sock
```

## Enabling Kubernetes

To enable Kubernetes client inside of your container, you will need to mount your Kubernetes configs.

```txt
--volume ~/.kube:/usr/local/share/kube
```

On Windows systems, you may need to use `%USERPROFILE%` instead of `~` to refer to your home directory.

```txt
--volume %USERPROFILE%/.kube:/usr/local/share/kube
```

## Enabling systemctl

If you wish to enable systemctl, you'll need to launch your container in a privileged mode by including `--privileged` and `/usr/sbin/init` in your `run` command.

```txt
docker run --tty --detach --privileged --name <name> andrebienemann/dde /usr/sbin/init
```

## Links

- [Source Code](https://github.com/andrebienemann/dde/)
- [Issue Tracker](https://github.com/andrebienemann/dde/issues/)
