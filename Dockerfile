FROM lsiobase/ubuntu:jammy

ARG DEBIAN_FRONTEND="noninteractive"
ARG HYPERHDR_URL="https://github.com/awawa-dev/HyperHDR/releases/download"
ARG HYPERHDR_VERSION=
ARG ARCH=

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y --no-install-recommends \
    wget && \
 echo "**** install HyperHDR ${HYPERHDR_VERSION} ****" && \
 wget -qP /tmp ${HYPERHDR_URL}/v${HYPERHDR_VERSION}/HyperHDR-${HYPERHDR_VERSION}-Linux-${ARCH}.deb && \
 apt install -y ./tmp/HyperHDR-${HYPERHDR_VERSION}-Linux-${ARCH}.deb && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8090 8092 19400 19444 19445
VOLUME /config
