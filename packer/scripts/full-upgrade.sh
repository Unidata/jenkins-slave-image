#!/usr/bin/env bash

# Exit immediately if any command exits with a non-zero status.
set -e

# Update the package list
apt-get -y update

# Perform a completely hands-off dist-upgrade on Ubuntu. See https://askubuntu.com/a/262445

unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
ucf --purge /boot/grub/menu.lst

export DEBIAN_FRONTEND=noninteractive
apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade
