FROM docker.io/zmkfirmware/zmk-build-arm:stable

RUN apt-get update && \
    apt-get install -y pipx && \
    mkdir -p /app && \
    chown ubuntu:ubuntu /app

USER ubuntu
WORKDIR /app

ENV PATH="$PATH:/home/ubuntu/.local/bin"
# RUN pipx install keymap-drawer
RUN pipx install git+https://github.com/caksoylar/keymap-drawer

COPY config/west.yml config/west.yml
RUN west init -l config && \
    west update && \
    west zephyr-export && \
    mkdir -p build

COPY bin/build_cornish_zen.sh /usr/bin
COPY bin/build_cornish_zen_keymap.sh /usr/bin

# run keymap to cache fonts
COPY keymap/corneish_zen_dummy.yaml /tmp/corneish_zen.yaml
COPY keymap/config_dummy.yaml /tmp/config.yaml
RUN keymap -c /tmp/config.yaml draw /tmp/corneish_zen.yaml >/tmp/corneish_zen.svg

