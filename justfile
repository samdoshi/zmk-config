build: firmware keymap

firmware: image
  podman run --rm -it \
    -v $(pwd)/config:/app/config:ro \
    -v $(pwd)/keymap:/app/keymap \
    -v $(pwd)/firmware:/app/firmware \
    zmk-config \
    build_cornish_zen.sh

keymap: image
  podman run --rm -it \
    -v $(PWD)/config:/app/config:ro \
    -v $(PWD)/keymap:/app/keymap \
    -v $(PWD)/firmware:/app/firmware \
    zmk-config \
    build_cornish_zen_keymap.sh

shell: image
  podman run --rm -it \
    -v $(PWD)/config:/app/config:ro \
    -v $(PWD)/keymap:/app/keymap \
    -v $(PWD)/firmware:/app/firmware \
    zmk-config \
    bash

image:
  podman build --tag zmk-config .

update-dummy:
  cp keymap/config.yaml keymap/config_dummy.yaml
  cp keymap/corneish_zen.yaml keymap/corneish_zen_dummy.yaml

clean:
  rm firmware/*.uf2

distclean: clean
  podman rmi zmk-config
