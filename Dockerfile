FROM norionomura/swift:base8
MAINTAINER Norio Nomura <norio.nomura@gmail.com>

# Install Swift keys
RUN curl https://swift.org/keys/all-keys.asc | gpg2 --import - && \
    gpg2 --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

ENV SWIFT_BRANCH=swift-4.2-branch \
    SWIFT_PLATFORM=ubuntu16.04 \
    SWIFT_VERSION=4.2-DEVELOPMENT-SNAPSHOT-2018-05-12-a

# Install Swift Ubuntu Snapshot
RUN SWIFT_ARCHIVE_NAME=swift-$SWIFT_VERSION-$SWIFT_PLATFORM && \
    SWIFT_URL=https://swift.org/builds/$SWIFT_BRANCH/$(echo "$SWIFT_PLATFORM" | tr -d .)/swift-$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME.tar.gz && \
    curl -O $SWIFT_URL && \
    curl -O $SWIFT_URL.sig && \
    gpg2 --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz --directory / --strip-components=1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/* && \
    chmod -R o+r /usr/lib/swift

# Set Swift Path
ENV PATH /usr/bin:$PATH

# Print Installed Swift Version
RUN swift --version
