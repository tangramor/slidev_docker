#!/bin/bash

docker run --name slidev -d --rm -it \
    -v ${PWD}:/slidev \
    -p 3030:3030 \
    tangramor/slidev:playwright
