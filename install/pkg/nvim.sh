#!/bin/bash

CONFIG_DIR="$(HOME)/.config/nvim"
DATA_DIR="$(HOME)/.local/share/nvim"
STATE_DIR="$(HOME)/.local/state/nvim"
CACHE_DIR="$(HOME)/.cache/nvim"

rm -rf $DATA_DIR $STATE_DIR $CACHE_DIR

mkdir -p "$(dirname "$CONFIG_DIR")"
mkdir -p "$(dirname "$DATA_DIR")"
