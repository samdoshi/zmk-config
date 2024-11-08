#!/usr/bin/env bash

set -e

keymap -c keymap/config.yaml parse -z config/corneish_zen.keymap >keymap/corneish_zen.yaml
keymap -c keymap/config.yaml draw keymap/corneish_zen.yaml >keymap/corneish_zen.svg
