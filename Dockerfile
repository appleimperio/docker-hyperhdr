FROM debian:bullseye-slim

ARG  FOLDER_VERSION=v18.0.0.0
ARG  HYPERHDR_VERSION=18.0.0.0
ARG  PROCESSOR_TYPE=aarch64

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y wget && \
    wget -qP /tmp https://github.com/awawa-dev/HyperHDR/releases/download/${FOLDER_VERSION}/HyperHDR-${HYPERHDR_VERSION}-Linux-${PROCESSOR_TYPE}.deb && \
    apt install -y /tmp/HyperHDR-${HYPERHDR_VERSION}-Linux-${PROCESSOR_TYPE}.deb && \
    rm /tmp/HyperHDR-${HYPERHDR_VERSION}-Linux-${PROCESSOR_TYPE}.deb

EXPOSE 8090 19444 19445

RUN echo 'Running webUIon port 8090. Port 19444-19445 exposed for json, protobuffer server (hyperion-screen-cap)'

CMD ["hyperhdr"]
