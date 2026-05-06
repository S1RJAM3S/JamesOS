mapfile -t pkgs < <(grep -vE '^#|^$' "$SIRJAMES_INSTALL/base.pkgs")
pkg-install "$(pkgs[@])"
