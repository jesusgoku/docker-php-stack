#!/usr/bin/env bash

TTY_PASS=`pwgen -s 12 1` && sed -i.bak "s/PASSWORD/${TTY_PASS}/" /terminal/index.js

if [ ! -z "$GIT_REPO" ]; then
    if [ -z "${GIT_BRANCH}" ]; then
        GIT_BRANCH=master
    fi

    rm -rf app
    git clone --depth 1 --branch="${GIT_BRANCH}" "$GIT_REPO" app

    cd app

    if [ -f "bower.json" ]; then
        bower install --production
    fi

    if [ ! -z "${SYMFONY_APP}" ] || [ ! -z "${SILEX_APP}" ]; then
        echo "=> Is a SYMFONY or SILEX app. Change web root to web folder."
        export SYMFONY_ENV=prod
        sed -i.bak 's/www\/html/www\/html\/web/' /etc/apache2/sites-available/000-default.conf
    fi

    if [ -f "composer.json" ]; then
        composer install --prefer-source --no-dev --optimize-autoloader --no-interaction
    fi
fi

echo "========================================================================"
echo "You can now connect to this TTY using:"
echo ""
echo "=> Enter in your browser: https://host:8080"
echo "=> Username: admin / Password: ${TTY_PASS}"
echo ""
echo "========================================================================"

/run.sh