#!/usr/bin/env bash

set -e

west build \
  --build-dir "build" \
  --board "xiao_ble/nrf52840/zmk" \
  --shield "prospector_scanner" \
  --source zmk/app \
  -- \
  -DZMK_CONFIG=/app/config

cp "build/zephyr/zmk.uf2" "firmware/prospector_scanner.uf2"
