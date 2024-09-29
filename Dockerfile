FROM docker.io/zmkfirmware/zmk-build-arm:stable

RUN apt-get update && \
    apt-get install -y pipx && \
    mkdir -p /app && \
    chown ubuntu:ubuntu /app

USER ubuntu
WORKDIR /app

ENV PATH="$PATH:/home/ubuntu/.local/bin"
RUN pipx install keymap-drawer

COPY config/west.yml config/west.yml
RUN west init -l config && \
    west update && \
    west zephyr-export && \
    mkdir -p build

COPY bin/build_cornish_zen.sh /usr/bin
