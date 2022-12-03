#!/bin/bash

# $ . demo.sh

# build containers
docker build . -t server

# docker container and docker host ports
CONTAINER='8000'
HOST='8000'

# run containers
docker run \
    --rm -d \
    --name server_at_8000 \
    -p 0.0.0.0:$HOST:$CONTAINER \
    server \
    server_at_8000 $CONTAINER

HOST='8001'

docker run \
    --rm -d \
    --name server_at_8001 \
    -p 0.0.0.0:$HOST:$CONTAINER \
    server \
    server_at_8001 $CONTAINER
