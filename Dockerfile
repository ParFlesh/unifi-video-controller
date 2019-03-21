FROM ubuntu

ARG UV_VER=v3.10.1

RUN apt update && \
	apt install -y wget && \
	wget https://dl.ubnt.com/firmwares/ufv/${UV_VER}/unifi-video.Debian7_amd64.${UV_VER}.deb && \
	apt install -y ./unifi-video.Debian7_amd64.${UV_VER}.deb && \
	rm ./unifi-video.Debian7_amd64.${UV_VER}.deb && \
	mkdir /config && \
	chown -Rf 1001:0 /config /usr/lib/unifi-video && \
	chmod -Rf 770 /config /usr/lib/unifi-video && \
	apt clean && \
	rm -Rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ADD root/ /

USER 1001

WORKDIR /usr/lib/unifi-video
VOLUME /config
EXPOSE 7080/tcp 7443/tcp 6666/tcp 7442/tcp 7445/tcp 7446/tcp 7447

CMD [ "/run.sh" ]
