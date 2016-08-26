FROM ubuntu:14.04
MAINTAINER Norio Nomura <norio.nomura@gmail.com>

# Install related packages
RUN apt-get update && \
    apt-get install -y \
      build-essential \
      clang \
      git \
      libedit-dev \
      libicu52 \
      libxml2 \
      python2.7 \
      python2.7-dev \
      wget \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
