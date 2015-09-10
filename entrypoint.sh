#!/usr/bin/env bash

TTY_PASS=`pwgen -s 12 1` && sed -i.bak "s/PASSWORD/${TTY_PASS}/" /terminal/index.js
# pm2 start /terminal/index.js -i 0 --name "terminal"

echo "========================================================================"
echo "You can now connect to this TTY using:"
echo ""
echo "=> Enter in your browser: https://host:8080"
echo "=> Username: admin / Password: ${TTY_PASS}"
echo ""
echo "========================================================================"


if [ ! -z "$GIT_REPO" ]; then
    rm -rf app
    git clone --depth 1 "$GIT_REPO" app
fi

/run.sh