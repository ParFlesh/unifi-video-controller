FROM ubuntu

ADD https://dl.ubnt.com/firmwares/ufv/v3.10.1/unifi-video.Debian7_amd64.v3.10.1.deb /

RUN apt update && \
	apt install -y /unifi-video.Debian7_amd64.v3.10.1.deb && \
	apt clean && \
	rm -Rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ADD root/ /

WORKDIR /usr/lib/unifi-video
VOLUME /config
EXPOSE 7080/tcp 7443/tcp 6666/tcp 7442/tcp 7445/tcp 7446/tcp 7447

CMD [ "/run.sh" ]
