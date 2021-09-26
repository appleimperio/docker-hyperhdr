FROM ubuntu:20.04 as build
LABEL author="nocturno@pm.me" \
      maintainer="nocturno@pm.me"
      
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends git cmake build-essential \
    libasound2-dev qtbase5-dev libqt5serialport5-dev libqt5sql5-sqlite libqt5svg5-dev libqt5x11extras5-dev libusb-1.0-0-dev \
    python3-minimal rpm libcec-dev libxcb-image0-dev libxcb-util0-dev libxcb-shm0-dev libglvnd-dev \
    libxcb-render0-dev libxcb-randr0-dev libxrandr-dev libxrender-dev libavahi-core-dev libavahi-compat-libdnssd-dev \
    libjpeg-dev libturbojpeg0-dev libssl-dev zlib1g-dev ca-certificates curl wget dialog apt-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/awawa-dev/HyperHDR/releases/download/v17.0.0.0/HyperHDR-17.0.0.0-Linux-aarch64.deb
RUN apt-get install -y ./HyperHDR-17.0.0.0-Linux-aarch64.deb

RUN rm HyperHDR-17.0.0.0-Linux-aarch64.deb

EXPOSE 8090 19444 19445

RUN echo 'Running webUIon port 8090. Port 19444-19445 exposed for json, protobuffer server (hyperion-screen-cap)'

CMD ["hyperhdr"]
