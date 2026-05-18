#!/bin/bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[@]}" )" &>/dev/null && pwd )
STOW_DIR="$SCRIPT_DIR"

HOME_DIRS=(
    "$HOME/.config"
    "$HOME/.local/bin"
)

for dir in "${HOME_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
	echo "[MKDIR] $dir"
	mkdir -p "$dir"
    elif [ -L "$dir" ]; then
	echo "[ERROR] $dir: Symlink!"
	exit 1
    fi
done

stow -v "$@" -d "$STOW_DIR" -t "$HOME" "home"
