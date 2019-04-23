FROM jenkins/jenkins:lts
MAINTAINER Hidekuma<d.hidekuma@gmail.com>

USER root

RUN apt-get update

ENV DOCKER_VERSION 18.09.0
ENV DOCKER_COMPOSE_VERSION 1.23.1
RUN curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | tar --strip-components=1 -xz -C /usr/local/bin docker/docker
RUN curl -fsSL https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN git config --global user.email "d.hidekuma@gmail.com"
RUN git config --global user.name "hidekuma"

HEALTHCHECK --interval=30s CMD curl localhost:8080
