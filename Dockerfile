FROM alpine:latest

LABEL maintainer "Adrian Kriel <admin@extremeshok.com>"

RUN apk add --update --no-cache \
	curl \
	unbound \
	bash \
	openssl \
	drill \
	&& curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache \
	&& chown root:unbound /etc/unbound \
	&& chmod 775 /etc/unbound \
	&& adduser unbound tty

EXPOSE 53/udp 53/tcp

COPY ./rootfs /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
