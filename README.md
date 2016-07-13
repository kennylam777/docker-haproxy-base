# docker-haproxy-base
Base docker image for [haproxy](http://www.haproxy.org/)

An haproxy docker image based on [alpine linux](http://www.alpinelinux.org/), so it's tiny.

Haproxy is compiled with support for TLS/SSL, HTTP compression, and LUA in addition to all the normal haproxy load balancing goodness. A Linux kernel >= 3.7 is required for some options (e.g. TFO).

Additional binaries that are also installed and very useful for managing haproxy include: `halog`, `openssl`, `socat`, `haproxy-systemd-wrapper`

It's on [docker-hub](https://hub.docker.com/r/fingershock/haproxy-base/) and [github](https://github.com/iJJi/docker-haproxy-base)

## tags and links
 * `latest`, `1.6`, `1.6.7` Current stable release [(Dockerfile)](https://github.com/iJJi/docker-haproxy-base/blob/master/Dockerfile-1.6) [![](https://badge.imagelayers.io/fingershock/haproxy-base:1.6.svg)](https://imagelayers.io/?images=fingershock/haproxy-base:1.6) [![Build Status](https://travis-ci.org/iJJi/docker-haproxy-base.svg?branch=master)](https://travis-ci.org/iJJi/docker-haproxy-base)
 * `1.5`, `1.5.18` Previous stable release [(Dockerfile)](https://github.com/iJJi/docker-haproxy-base/blob/master/Dockerfile-1.5) [![](https://badge.imagelayers.io/fingershock/haproxy-base:1.5.svg)](https://imagelayers.io/?images=fingershock/haproxy-base:1.5) [![Build Status](https://travis-ci.org/iJJi/docker-haproxy-base.svg?branch=master)](https://travis-ci.org/iJJi/docker-haproxy-base)
 * `1.7`, `1.7-dev3` Development pre-release [(Dockerfile)](https://github.com/iJJi/docker-haproxy-base/blob/master/Dockerfile-1.7) [![](https://badge.imagelayers.io/fingershock/haproxy-base:1.7.svg)](https://imagelayers.io/?images=fingershock/haproxy-base:1.7) [![Build Status](https://travis-ci.org/iJJi/docker-haproxy-base.svg?branch=master)](https://travis-ci.org/iJJi/docker-haproxy-base)


## running

To build the image, clone the repo and run
```sh
docker build -t fingershock/haproxy-base -f Dockerfile-1.6 .
```

The image is basic and includes no [haproxy configuration](https://cbonte.github.io/haproxy-dconv/configuration-1.6.html) file so to be useful either build a new image with this one as a base and include whatever haproxy configuration is needed, or bind-mount the haproxy configuration file or /usr/local/etc/haproxy configuration directory.

To test that haproxy is built and runs
```sh
docker run -it --rm fingershock/haproxy-base haproxy -vv
```

To run with configuration bind-mounted from a directory and get logs from the container to the docker0 host
```sh
docker run -it --rm -v /var/log:/var/log -v /my/config:/usr/local/etc/haproxy:ro  fingershock/haproxy-base haproxy -f /usr/local/etc/haproxy/haproxy.cfg -c
```

