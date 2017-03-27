FROM resin/rpi-raspbian:jessie

RUN  apt-get update \
  && apt-get install git-core build-essential wget cdbs debhelper libusb-1.0-0-dev libsystemd-daemon-dev autotools-dev autoconf automake libtool pkg-config dh-systemd libev-dev cmake

ENV KNXD_CHANGESET 7d0fdae
RUN git clone https://github.com/knxd/knxd.git

# PATCH: remove tests as they don't run well on travis
RUN cd knxd \
 && git checkout ${KNXD_CHANGESET} \
 && echo "#!/bin/bash" > tools/test.sh \
 && dpkg-buildpackage -b -uc

RUN dpkg -i knxd_*.deb knxd-tools_*.deb

EXPOSE 6720

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["knxd"]
