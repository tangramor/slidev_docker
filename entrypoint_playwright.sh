#!/bin/sh

if [ "$NPM_MIRROR" != "" ]; then
    npm config set registry $NPM_MIRROR
fi

npm i @slidev/cli @slidev/theme-seriph @slidev/theme-default
npm i -D playwright-chromium

if [ -f /slidev/slides.md ]; then
    echo "Start slidev..."
    
else
    echo "slides.md not found in the bind mount to /slidev"
    cp -f /usr/local/lib/node_modules/@slidev/cli/template.md /slidev/slides.md
    sed -i ':a;N;$!ba;s/GitHub"\n/GitHub"/g' /slidev/slides.md

fi

if [ "$NPM_MIRROR" != "" ]; then
    npm config delete registry
fi

npx slidev --remote
