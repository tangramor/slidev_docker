#!/bin/bash

docker build -t tangramor/slidev:node25.2.1 .

docker tag tangramor/slidev:node25.2.1 tangramor/slidev:latest