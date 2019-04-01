FROM ubuntu:16.04
LABEL maintainer="Norio Nomura <norio.nomura@gmail.com>"
LABEL description="A base image to reduce overall capacity when using multiple images provided by norionomura/swift"

# Install Dependencies

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get install -y \
      binutils \
      curl \
      git \
      gnupg2 \
      libatomic1 \
      libbsd0 \
      libc6 \
      libcurl3 \
      libedit2 \
      libgcc1 \
      libpython2.7 \
      libstdc++6 \
      libuuid1 \
      libxml2 \
      make \
      pkg-config \
      python2.7 \
      tzdata \
      zlib1g-dev \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*