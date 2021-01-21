# docker-hyperhdr

This is HyperHDR v14.0.0 Linux Armv7 based on https://github.com/pewter77/docker-hyperhdr thanks pewtwr77 and thanks to the developer Awawa https://github.com/awawa-dev/HyperHDR

Run the container

docker run -d --name=hyperhdr -e PUID=1000 -e PGID=1000 -e TZ=America/New_York -p=8090:8090 -p=19445:19445 -p=19444:19444 -v /PATH_TO_YOUR_CONFIG:/config --device=/dev/video0 --restart=unless-stopped nocturno/hyper-hdr:armv7

In this instance PUID=1000 and PGID=1000, to find yours use id user as below:

$ id username uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)

The device path should match your video input in this case is 0 or if you don't know your video device the easiest way is replace --device=/dev/video0 for --privileged
