FROM ubuntu:16.04
MAINTAINER Norio Nomura <norio.nomura@gmail.com>

# Install Dependencies

RUN apt-get update && \
    apt-get install -y \
      clang \
      curl \
      git \
      gnupg2 \
      libblocksruntime0 \
      libcurl4-openssl-dev \
      libedit2 \
      libicu-dev \
      libpython2.7-dev \
      libxml2-dev \
      make \
      python2.7 \
      tzdata \
      uuid-dev \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
