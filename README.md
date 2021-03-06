# docker-haproxy-base
Base docker image for [haproxy](http://www.haproxy.org/)

An haproxy docker image based on [alpine linux](http://www.alpinelinux.org/), so it's tiny.

Haproxy is compiled with support for TLS/SSL, HTTP compression, and LUA in addition to all the normal haproxy load balancing goodness. A Linux kernel >= 3.7 is required for some options (e.g. TFO).

Additional binaries that are also installed (when available) and very useful for managing haproxy include: `halog`, `openssl`, `socat`, `haproxy-systemd-wrapper`

It's on [docker-hub](https://hub.docker.com/r/fingershock/haproxy-base/) and [github](https://github.com/iJJi/docker-haproxy-base)

## tags and links
 * `1.8`, `1.8-rc4` Development release [(Dockerfile)](https://github.com/iJJi/docker-haproxy-base/blob/master/Dockerfile-1.8) [![](https://images.microbadger.com/badges/image/fingershock/haproxy-base:1.8.svg)](http://microbadger.com/images/fingershock/haproxy-base "Get your own image badge on microbadger.com") [![Build Status](https://travis-ci.org/iJJi/docker-haproxy-base.svg?branch=master)](https://travis-ci.org/iJJi/docker-haproxy-base)
 * `latest`, `1.7`, `1.7.9` Current stable release [(Dockerfile)](https://github.com/iJJi/docker-haproxy-base/blob/master/Dockerfile-1.7) [![](https://images.microbadger.com/badges/image/fingershock/haproxy-base:1.7.svg)](http://microbadger.com/images/fingershock/haproxy-base "Get your own image badge on microbadger.com") [![Build Status](https://travis-ci.org/iJJi/docker-haproxy-base.svg?branch=master)](https://travis-ci.org/iJJi/docker-haproxy-base)
 * `1.6`, `1.6.13` Previous stable release [(Dockerfile)](https://github.com/iJJi/docker-haproxy-base/blob/master/Dockerfile-1.6) [![](https://images.microbadger.com/badges/image/fingershock/haproxy-base:1.6.svg)](http://microbadger.com/images/fingershock/haproxy-base "Get your own image badge on microbadger.com") [![Build Status](https://travis-ci.org/iJJi/docker-haproxy-base.svg?branch=master)](https://travis-ci.org/iJJi/docker-haproxy-base)
 * `1.5`, `1.5.19` Previous stable release [(Dockerfile)](https://github.com/iJJi/docker-haproxy-base/blob/master/Dockerfile-1.5) [![](https://images.microbadger.com/badges/image/fingershock/haproxy-base:1.5.svg)](http://microbadger.com/images/fingershock/haproxy-base "Get your own image badge on microbadger.com") [![Build Status](https://travis-ci.org/iJJi/docker-haproxy-base.svg?branch=master)](https://travis-ci.org/iJJi/docker-haproxy-base)


## running

To build the image, clone the repo and run
```sh
./build.sh Dockerfile-1.7
```

The image is basic and includes no [haproxy configuration](https://cbonte.github.io/haproxy-dconv/) file so to be useful either build a new image with this one as a base and include whatever haproxy configuration is needed, or bind-mount the haproxy configuration file or /usr/local/etc/haproxy configuration directory.

To test that haproxy is built and runs
```sh
docker run -it --rm fingershock/haproxy-base:1.7 haproxy -vv
```

To run with configuration bind-mounted from a directory and get logs from the container to the docker0 host
```sh
docker run -it --rm -v /var/log:/var/log -v /my/config:/usr/local/etc/haproxy:ro  fingershock/haproxy-base:1.7 haproxy -f /usr/local/etc/haproxy/haproxy.cfg -c
```

