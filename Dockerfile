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
      libssl-dev \
      libxml2-dev \
      make \
      pkg-config \
      python2.7 \
      tzdata \
      uuid-dev \
      zlib1g-dev \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    LLVM_VERSION=`cd /usr/bin; ls llvm-config-*|sed 's/llvm-config-//'` && \
    (cd /usr/bin; ls -1 llvm*-$LLVM_VERSION) | sed -e '/llvm-config/d' -e "s/-$LLVM_VERSION//" | \
    awk -v LLVM_VERSION=$LLVM_VERSION 'BEGIN{print "update-alternatives --force --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-"LLVM_VERSION" 200 \\"}{print "--slave /usr/bin/"$0, $0, "/usr/bin/"$0"-"LLVM_VERSION" \\" }' | sh
