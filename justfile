build: build-image
  podman run --rm -it \
    -v $(PWD)/config:/app/config:ro \
    -v $(PWD)/keymap:/app/keymap \
    -v $(PWD)/firmware:/app/firmware \
    zmk-config \
    build_cornish_zen.sh

shell: build-image
  podman run --rm -it \
    -v $(PWD)/config:/app/config:ro \
    -v $(PWD)/keymap:/app/keymap \
    -v $(PWD)/firmware:/app/firmware \
    zmk-config \
    bash

build-image:
  podman build --tag zmk-config .

clean:
  rm firmware/*.uf2

distclean: clean
  podman rmi zmk-config
