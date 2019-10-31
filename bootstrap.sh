#!/usr/bin/env bash

git pull

rsync --exclude ".git" \
    --exclude "LICENSE" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    -avh --no-perms . ~
