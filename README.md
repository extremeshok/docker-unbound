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

# environment
UNBOUND_ENABLE_IPV6=false (set to true to enable ipv6 support)
