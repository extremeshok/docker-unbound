#!/bin/bash
################################################################################
# This is property of eXtremeSHOK.com
# You are free to use, modify and distribute, however you may not remove this notice.
# Copyright (c) Adrian Jon Kriel :: admin@extremeshok.com
################################################################################

## enable case insensitve matching
shopt -s nocaseglob

XS_ENABLE_IPV6=${UNBOUND_ENABLE_IPV6:-no}

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

if [ "$XS_ENABLE_IPV6" == "yes" ] || [ "$XS_ENABLE_IPV6" == "true" ] || [ "$XS_ENABLE_IPV6" == "on" ] || [ "$XS_ENABLE_IPV6" == "1" ] ; then
  sed -i "s/do-ip6: no/do-ip6: yes/g" /etc/unbound/unbound.conf
  sed -i "s/prefer-ip6: no/prefer-ip6: yes/g" /etc/unbound/unbound.conf
  echo "IPv6 Enabled"
else
  sed -i "s/do-ip6: yes/do-ip6: no/g" /etc/unbound/unbound.conf
  sed -i "s/prefer-ip6: yes/prefer-ip6: no/g" /etc/unbound/unbound.conf
  echo "IPv6 Disabled"
fi

exec /usr/sbin/unbound
