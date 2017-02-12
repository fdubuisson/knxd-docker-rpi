# knxd-build-docker-rpi
Docker image to build knxd with all required dependencies on a raspberry pi. Tested on a raspi3/Jessie.

Just add parameters on the 'docker run' command; ex:
```
sudo docker build -t knxd .
sudo docker run knxd -i 6720 -b iptn:192.168.1.13
```

Tools are also available:
```
sudo docker run knxd knxtool groupreadresponse 6/0/3
```
