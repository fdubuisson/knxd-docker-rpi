# knxd-docker-rpi [![Build Status](https://travis-ci.org/f-dubuisson/knxd-docker-rpi.png)](https://travis-ci.org/f-dubuisson/knxd-docker-rpi)
Docker image to build and run knxd with all required dependencies on a raspberry pi. Tested on a raspi3/Jessie.

Just add parameters on the 'docker run' command; ex:
```
sudo docker build -t knxd .
sudo docker run --network=host knxd -e 0.0.1 -E 2.2.20:10 -RTS -i 6720 -b ipt:192.168.1.13
```

Tools are also available:
```
sudo docker run knxd knxtool groupreadresponse 6/0/3
```
