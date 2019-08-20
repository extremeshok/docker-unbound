FROM alpine:latest

LABEL maintainer "Adrian Kriel <admin@extremeshok.com>"

RUN apk add --update --no-cache \
	bash \
	curl \
	drill \
	openssl \
	tzdata \
	unbound \
	&& curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache \
	&& adduser unbound tty \
	&& chown root:unbound /etc/unbound \
	&& chmod 775 /etc/unbound

EXPOSE 53/udp 53/tcp

COPY ./rootfs /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
