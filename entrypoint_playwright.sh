#!/bin/sh

npm i @slidev/cli @slidev/theme-seriph @slidev/theme-default
npm i -D playwright-chromium

if [ -f /slidev/slides.md ]; then
    echo "Start slidev..."
    
else
    cp -f /usr/local/lib/node_modules/@slidev/cli/template.md /slidev/slides.md
    sed -i ':a;N;$!ba;s/GitHub"\n/GitHub"/g' /slidev/slides.md

fi

npm config delete registry

npx slidev --remote
