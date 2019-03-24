FROM norionomura/swift:base9
LABEL maintainer="Norio Nomura <norio.nomura@gmail.com>"

ENV SWIFT_PLATFORM=ubuntu16.04 \
    SWIFT_GITHUB_PR=* \
    SWIFT_CI_BUILD_NUMBER=* \
    SWIFT_VERSION=PR-*-*

# Install Swift toolchain for ubuntu
RUN SWIFT_ARCHIVE=swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz && \
    SWIFT_URL=https://ci.swift.org/job/swift-PR-toolchain-Linux/$SWIFT_CI_BUILD_NUMBER//artifact/branch-master/$SWIFT_ARCHIVE && \
    curl -O $SWIFT_URL && \
    tar -xvzf $SWIFT_ARCHIVE --directory / && \
    LIB_CLANG=/usr/lib/clang/7.0.0 && diff -r $LIB_CLANG /usr/lib/lldb/clang && rm -rf /usr/lib/lldb/clang && ln -sfr $LIB_CLANG /usr/lib/lldb/clang && \
    rm -rf $SWIFT_ARCHIVE* /tmp/* /var/tmp/* && \
    chmod -R o+r /usr/lib/swift

# Print Installed Swift Version
RUN swift --version
