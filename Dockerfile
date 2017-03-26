FROM resin/rpi-raspbian:jessie

RUN  apt-get update \
  && apt-get install git-core build-essential wget cdbs debhelper libusb-1.0-0-dev libsystemd-daemon-dev autotools-dev autoconf automake libtool pkg-config dh-systemd libev-dev

ENV KNXD_CHANGESET 4770a9f
RUN git clone https://github.com/knxd/knxd.git

# PATCH: remove tests as they don't run well on travis
RUN cd knxd \
 && echo "#!/bin/bash" > tools/test.sh
 && git checkout ${KNXD_CHANGESET}
 && dpkg-buildpackage -b -uc

RUN dpkg -i knxd_*.deb knxd-tools_*.deb

EXPOSE 6720

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["knxd"]
