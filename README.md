# docker-haproxy-base
Base docker image for haproxy

An haproxy docker image based on alpine linux, so it's very small at about 15 MiB.
[![](https://badge.imagelayers.io/fingershock/haproxy-base:latest.svg)](https://imagelayers.io/?images=fingershock/haproxy-base:latest)

Haproxy is compiled with support for SSL, compression, and LUA in addition to all the normal haproxy load balancing goodness.

To build the image
```sh
docker build -t haproxy-base .
```

The image is basic and includes no haproxy configuration file so to be useful either build a new image with this one
as a base and include whatever haproxy configuration is needed, or bind-mount the haproxy configuration file or the
entire /usr/local/etc/haproxy directory.

To test that haproxy is built and runs

```sh
docker run -it --rm haproxy-base haproxy -vv
```

To run with configuration bind-mounted from a directory and get logs from the container to the docker0 host

```sh
docker run -it --rm -v /var/log:/var/log -v /my/config:/usr/local/etc/haproxy:ro  haproxy-base haproxy -f /usr/local/etc/haproxy/haproxy.cfg -c
```
