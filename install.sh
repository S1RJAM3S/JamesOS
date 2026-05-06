#!/bin/bash

set -eEo pipefail

export SIRJAMES_PATH="$HOME/.local/share/sirjames"
export SIRJAMES_INSTALL="$SIRJAMES_PATH/install"
export PATH="$SIRJAMES_PATH/bin:$PATH"

source "$SIRJAMES_INSTALL/
