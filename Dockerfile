FROM alpine:latest

LABEL maintainer "Adrian Kriel <admin@extremeshok.com>"

RUN apk add --update --no-cache \
	bash \
	curl \
	drill \
	openssl \
	tzdata \
	unbound \
	&& adduser unbound tty \
	&& chown root:unbound /etc/unbound \
	&& chmod 775 /etc/unbound

EXPOSE 53/udp 53/tcp 8953/tcp

COPY ./rootfs /

RUN chmod +x /docker-entrypoint.sh

HEALTHCHECK --interval=5s --timeout=5s CMD nslookup healthcheck.unbound.local 127.0.0.1

ENTRYPOINT ["/docker-entrypoint.sh"]
