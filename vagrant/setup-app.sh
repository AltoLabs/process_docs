#!/usr/bin/env bash

echo "Installing Ruby Version Manager..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash
source $HOME/.rvm/scripts/rvm

echo "Installing Ruby 2.2.0..."
rvm use --default --install 2.2.0

cd /vagrant
echo "Installing the bundle and foreman gems..."
gem install bundle foreman
echo "Installing dependencies from Gemfile..."
bundle
