mapfile -t pkgs < <(grep -vE '^#|^$' "$SIRJAMES_INSTALL/base.pkgs")
sirjames-pkg-install "$(pkgs[@])"
