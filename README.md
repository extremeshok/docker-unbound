# docker-unbound

https://hub.docker.com/r/extremeshok/unbound

Unbound is a validating, recursive, and caching DNS resolver.

View **docker-compose-sample.yml** in the source repository for usage

# features
- Alpine latest
- Log to console(tty)
- Remote-control enabled
- Secured for lan
- Highly optimized
- Memory caching
- Low CPU overhead (single thread)
- Sane min-TTL and max-TTL
- keys are saved to /etc/unbound/keys/
- HEALTHCHECK activated
- Downloads root.hints on first run
- Will download a new root.hints on start when it is older than 7days.
- DNSSEC enabled
- Persistent cache, cache is saved to /etc/unbound/keys/cache.db every 30min and loaded on start

# environment
UNBOUND_ENABLE_IPV6=false (set to true to enable ipv6 support)

# Notes
Threads hard coded to 1, see: https://wiki.archlinux.org/index.php/Unbound#Issues_concerning_num-threads
