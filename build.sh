#!/usr/bin/env bash

set -o xtrace
set -o pipefail
set -o errexit

GIT_REV=`git rev-parse --short HEAD`
BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
REPO="fingershock/haproxy-base"


build()
{
    dockerfile=$1
    docker build \
        --build-arg VCS_REF=$GIT_REV \
        --build-arg BUILD_DATE=$BUILD_DATE \
        -t ${REPO} -f $dockerfile .
}

tag()
{
    dockerfile=$1
    for tag in `docker run --rm ${REPO} sh -c 'echo $HAPROXY_MAJOR $HAPROXY_VERSION'`; do
        docker tag ${REPO} ${REPO}:$tag
    done
}

test()
{
    docker run --rm ${REPO} haproxy -vv
    docker run --rm ${REPO} halog -h
    docker run --rm ${REPO} openssl version
    docker run --rm ${REPO} socat -V
}

push()
{
    dockerfile=$1
    for tag in `docker run --rm ${REPO} sh -c 'echo $HAPROXY_MAJOR $HAPROXY_VERSION'`; do
        docker push ${REPO}:$tag
    done
    if [ "$dockerfile" = "Dockerfile-1.6" ]; then
        docker push ${REPO}:latest
    fi
}



while getopts "p" opt; do
    case "$opt" in
    p)  push=1
        ;;
    esac
done

shift $((OPTIND-1))

dockerfiles=${@:-$(ls Dockerfile-*)}

for d in $dockerfiles; do
    build $d
    test $d
    tag $d
    [[ $push ]] && echo push $d
done
