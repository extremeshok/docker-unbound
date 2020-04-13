FROM alpine:latest

LABEL maintainer "Adrian Kriel <admin@extremeshok.com>"

RUN apk add --update --no-cache \
	bash \
	curl \
	drill \
	openssl \
	tzdata \
	unbound \
	&& curl --connect-timeout 5 --max-time 10 --retry 5 --retry-delay 0 --retry-max-time 60 -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache \
	&& adduser unbound tty \
	&& chown root:unbound /etc/unbound \
	&& chmod 775 /etc/unbound

EXPOSE 53/udp 53/tcp 8953/tcp

COPY ./rootfs /

RUN chmod +x /docker-entrypoint.sh

HEALTHCHECK --interval=5s --timeout=5s CMD nslookup google.com 127.0.0.1

ENTRYPOINT ["/docker-entrypoint.sh"]
