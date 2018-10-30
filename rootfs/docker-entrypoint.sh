#!/bin/bash

echo "Setting console permissions..."
chown root:tty /dev/console
chmod g+rw /dev/console

echo "Receiving anchor key..."
/usr/sbin/unbound-anchor -a /etc/unbound/trusted-key.key

echo "Receiving root hints..."
curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache

echo "Enable remote control"
/usr/sbin/unbound-control-setup

chown -R unbound /etc/unbound

exec /usr/sbin/unbound
