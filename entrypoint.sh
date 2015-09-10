#!/usr/bin/env bash
ln -s /usr/bin/nodejs /usr/bin/node
cd /var/www/terminal
npm install
pm2 start /var/www/terminal/index.js -i 0 --name "terminal"
cd "$OLDPWD"

if [ ! -z "$GIT_REPO" ]; then
    rm -rf html
    git clone --depth 1 "$GIT_REPO" html
fi

apache2-foreground