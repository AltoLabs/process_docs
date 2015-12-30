#!/usr/bin/env bash

source $HOME/.rvm/scripts/rvm

echo "Installing RUBY"
rvm use --default --install 2.2.0

echo "Preparing application bundle..."
cd /vagrant
gem install bundle foreman
bundle
