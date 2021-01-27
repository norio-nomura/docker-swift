FROM norionomura/swift:base9
LABEL maintainer="Norio Nomura <norio.nomura@gmail.com>"

# Install Swift keys
RUN curl https://swift.org/keys/all-keys.asc | gpg2 --import -

ENV SWIFT_BRANCH=development \
    SWIFT_PLATFORM=ubuntu16.04 \
    SWIFT_VERSION=DEVELOPMENT-SNAPSHOT-2021-01-26-a

# Install Swift toolchain for ubuntu
RUN SWIFT_ARCHIVE_NAME=swift-$SWIFT_VERSION-$SWIFT_PLATFORM && \
    SWIFT_URL=https://swift.org/builds/$SWIFT_BRANCH/$(echo "$SWIFT_PLATFORM" | tr -d .)/swift-$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME.tar.gz && \
    curl -O $SWIFT_URL && \
    curl -O $SWIFT_URL.sig && \
    gpg2 --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz --directory / --strip-components=1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/* && \
    chmod -R o+r /usr/lib/swift

# Print Installed Swift Version
RUN swift --version
