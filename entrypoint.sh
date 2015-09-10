#!/usr/bin/env bash
if [ ! -z "$GIT_REPO" ]; then
    rm -rf html
    git clone --depth 1 "$GIT_REPO" html
fi
apache2-foreground