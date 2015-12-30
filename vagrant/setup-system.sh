#!/usr/bin/env bash

echo "Complettelly disabling and removing AppArmor..."
service apparmor stop && update-rc.d -f apparmor remove
apt-get --purge remove apparmor apparmor-utils libapparmor-perl libapparmor1

echo "Updating system..."
apt-get -y update && apt-get -y dist-upgrade

echo "Installing system requirements..."
apt-get install -y  bash curl git-core patch bzip2 openssl libreadline6 libreadline6-dev curl git-core \
                    zlib1g zlib1g-dev libssl-dev libyaml-dev libffi-dev libsqlite3-dev sqlite3 libxml2-dev \
                    libxslt-dev autoconf libc6-dev libgdbm-dev libncurses5-dev  automake libtool bison pkg-config \
                    linux-headers-generic build-essential dkms

echo "Cleaning-up the package system..."
apt-get autoremove -y --purge
