# docker-hyperhdr

This is HyperHDR v18.0.0 for Linux arm64 and armv7 thanks to the developer Awawa https://github.com/awawa-dev/HyperHDR

To pull the image use: docker pull nocturno/hyper-hdr:latest

Run the container

```
docker run -d \
--name=hyperhdr \
--net=host \
--device=/PATH TO YOUR VIDEO DEVICE usually /dev/video0:/dev/video0 \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=America/New_York \
-v /LOCAL PATH ON YOUR COMPUTER:/config \
--restart=unless-stopped \
nocturno/hyper-hdr:latest
```
The device path should match your video input in this case is 0 or if you don't know your video device the easiest way is replace --device=/dev/video0 for --privileged (not recommended)

I recommend using the compose file!
In the docker compose file (docker-compose.yaml) the PGID and the PUID both are set to 1000 wich is the default for the pi user. If you are not sure of your PGID or PUID just type id in the terminal of the pi and you will get something like this uid=1000(pi) gid=1000(pi) groups=1000(pi),4(adm). Just replace the uid number in the docker compose file section PUID and the same with the gid in PGID.
