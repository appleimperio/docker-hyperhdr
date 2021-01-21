FROM multiarch/qemu-user-static:arm as qemu
FROM arm32v7/debian:10.6-slim
COPY --from=qemu /usr/bin/qemu-arm-static /usr/bin

# Build arguments
ARG HYPERHDR_URL="https://github.com/awawa-dev/HyperHDR/releases/download"
ARG HYPERHDR_VERSION="14.0.0.0"
ARG ARCH="armv7l"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y --no-install-recommends \
 #           wget xz-utils libusb-1.0-0 libexpat1 libglu1-mesa libglib2.0-0 libfreetype6 && \
			 wget libglu1-mesa && \
 echo "**** install HyperHDR ****" && \
 wget -O /tmp/hyperhdr.deb ${HYPERHDR_URL}/v${HYPERHDR_VERSION}/HyperHDR-${HYPERHDR_VERSION}-Linux-${ARCH}.deb && \
 apt install -y ./tmp/hyperhdr.deb && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8090 19444 19445
VOLUME /config
