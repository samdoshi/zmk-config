#!/usr/bin/env bash

set -e

declare -a SIDES=("left" "right")

for SIDE in "${SIDES[@]}"; do
  west build \
    --pristine \
    --build-dir "build/$SIDE" \
    --board "corneish_zen_v2_$SIDE" \
    --source zmk/app \
    -- \
    -DZMK_CONFIG=/app/config

  cp "build/$SIDE/zephyr/zmk.uf2" "firmware/corneish_zen_v2_$SIDE.uf2"
done
