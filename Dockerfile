FROM extremeshok/baseimage-alpine:latest AS BUILD

LABEL mantainer="Adrian Kriel <admin@extremeshok.com>" vendor="eXtremeSHOK.com"

RUN echo "**** Install Packages ****" \
&& apk add --update --no-cache \
	drill \
	openssl \
    tcsh \
	tzdata \
	unbound

# add local files
COPY rootfs/ /

RUN echo "**** configure ****" \
&& adduser unbound tty \
&& chown root:unbound /etc/unbound \
&& chmod 775 /etc/unbound \
chmod +x /xshok-init.sh

WORKDIR /tmp/

EXPOSE 53/udp 53/tcp 8953/tcp

# "when the SIGTERM signal is sent, it immediately quits and all established connections are closed"
# "graceful stop is triggered when the SIGUSR1 signal is sent "
#STOPSIGNAL SIGUSR1

HEALTHCHECK --interval=5s --timeout=5s CMD nslookup healthcheck.unbound.local 127.0.0.1

ENTRYPOINT ["/init"]
