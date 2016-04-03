#!/bin/bash

source=${SOURCE-"/source"}
dest=${DEST-"/public"}
mkdir -p $source
cd $source

if [ ! -r "$source/_config.yml" ]; then
    if [ "x${REPO}" == "x" ]; then
	# no repo defined so start with a new install
	octopress new $source
    else
	git clone $REPO $source
    fi
fi

# If this is a git repo, pull new updates
if [ -d ".git" ]; then
    git pull
fi

if [ $SERVE == 1 ]; then
    jekyll serve --host 0.0.0.0
else
    if [ -r "_deploy.yml" ]; then
	octopress deploy
    else
	jekyll build --destination $dest --incremental
    fi
fi
