#!/bin/sh

npm config set registry https://registry.npm.taobao.org 

if [ -f /slidev/slides.md ]; then
    if [ -d /slidev/node_modules ]; then
        npm update
    else
        npm install
    fi
    echo "Start slidev..."
    npx slidev --remote
else
    echo "slides.md not found in the bind mount to /slidev"
    npm install @slidev/cli @slidev/theme-default @slidev/theme-seriph
    cp -f /slidev/node_modules/@slidev/cli/template.md /slidev/slides.md
    sed -i ':a;N;$!ba;s/alt="GitHub"\n/alt="GitHub"/g' /slidev/slides.md
    npx slidev --remote
fi