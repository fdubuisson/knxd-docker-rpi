FROM resin/rpi-raspbian:jessie

RUN  apt-get update \
  && apt-get install git-core build-essential wget cdbs debhelper libusb-1.0-0-dev libsystemd-daemon-dev autotools-dev autoconf automake libtool pkg-config dh-systemd
#libpthsem-dev libpthsem20

COPY build.sh .

VOLUME packages

CMD ["./build.sh"]
