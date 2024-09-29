FROM docker.io/zmkfirmware/zmk-build-arm:stable

RUN mkdir -p /app && chown ubuntu:ubuntu /app

USER ubuntu
WORKDIR /app
COPY config/west.yml config/west.yml

RUN west init -l config \
    && west update \
    && west zephyr-export \
    && mkdir -p build

COPY bin/build_cornish_zen.sh /usr/bin
