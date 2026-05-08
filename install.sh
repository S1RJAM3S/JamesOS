#!/bin/bash

set -eEo pipefail

export SIRJAMES_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
export SIRJAMES_INSTALL="$SIRJAMES_PATH/install"
export SIRJAMES_INSTALL_LOG="/var/log/sirjames-install.log"
export PATH="$SIRJAMES_PATH/bin:$PATH"

source "$SIRJAMES_INSTALL/
