#!/bin/bash

cd /

if [ ! -e /octopress/_config.yml ]; then
    git clone git://github.com/imathis/octopress.git octopress
fi
cd octopress

cp /opt/Gemfile /octopress
cp /opt/Rakefile /octopress

gem install bundler
rbenv rehash    # If you use rbenv, rehash to be able to run the bundle command
bundle install

#rake install

