#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    glu       \
    libdecor  \
    sdl_mixer \
    sdl_net

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package

# If the application needs to be manually built that has to be done down here
echo "Making stable build of Foobillard++..."
echo "---------------------------------------------------------------"
wget https://downloads.sourceforge.net/foobillardplus/foobillardplus-3.42beta.tar.gz
bsdtar -xvf foobillardplus-3.42beta.tar.gz

cd foobillardplus-3.42beta
