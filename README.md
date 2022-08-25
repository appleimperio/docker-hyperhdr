# docker-hyperhdr

This is HyperHDR v18.0.0 for Linux AARCH64 thanks to the developer Awawa https://github.com/awawa-dev/HyperHDR

To pull the image use: docker pull nocturno/hyper-hdr:latest

Run the container

docker run -d --name=hyperhdr --net=host -e TZ=America/New_York -v /LOCAL PATH ON YOUR COMPUTER:/root/.hyperhdr --device=/PATH TO YOUR VIDEO DEVICE (usually /dev/video0):/dev/video0 --restart=unless-stopped nocturno/hyper-hdr:latest

The device path should match your video input in this case is 0 or if you don't know your video device the easiest way is replace --device=/dev/video0 for --privileged (not recommended)

I recommend using the compose file!
