# Dockerised Development Environment

DDE is a development environment inside of a Docker container.

It is a quick and easy approach for provisioning lightweight disposable development environments.

DDE is based on a Ubuntu image and contains the following preinstalled software:
  - [apt](https://wiki.debian.org/Apt)
  - [zsh](https://www.zsh.org/)
  - [git](https://git-scm.com/)
  - [make](https://www.gnu.org/software/make/)
  - [nano](https://nano-editor.org/)
  - [curl](https://curl.se/)
  - [wget](https://www.gnu.org/software/wget/)
  - [htop](https://htop.dev/)

It also allows installing optional software during the set-up process:
  - [gcc](https://gcc.gnu.org/)
  - [nodejs](https://nodejs.org/en/)
  - [python3](https://www.python.org/)
  - [terraform](https://www.terraform.io/)
  - [docker](https://www.docker.com/)

## Quick Start

Create your development environment

```txt
docker run --tty --detach --name <name> andrebienemann/dde
```

Set it up

```txt
docker exec -it <name> setup
```

Zsh into it

```txt
docker exec -it <name> zsh
```

## Enabling Docker

Enable Docker on Linux

```txt
--volume /var/run/docker.sock:/var/run/docker.sock
```

Enable Docker on Windows

```txt
--volume //var/run/docker.sock:/var/run/docker.sock
```
