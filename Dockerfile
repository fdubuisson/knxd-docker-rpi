FROM resin/rpi-raspbian:jessie

RUN  apt-get update \
  && apt-get install git-core build-essential wget cdbs debhelper libusb-1.0-0-dev libsystemd-daemon-dev autotools-dev autoconf automake libtool pkg-config dh-systemd
#libpthsem-dev libpthsem20

COPY build.sh .

RUN apt-get install libev-dev

RUN ./build.sh

RUN dpkg -i /packages/libpthsem*.deb /packages/knxd_*.deb packages/knxd-tools_*.deb

EXPOSE 6720

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["knxd"]
