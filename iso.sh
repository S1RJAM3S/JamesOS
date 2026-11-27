#!/bin/bash
set -e
. ./build.sh

mkdir -p isodir/boot/grub

cp sysroot/boot/jamesos.kernel isodir/boot/jamesos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "jamesos" {
    multiboot /boot/jamesos.kernel
}
EOF
grub-mkrescue -o jamesos.iso isodir
