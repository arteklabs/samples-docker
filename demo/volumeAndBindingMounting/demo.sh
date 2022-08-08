#!/bin/bash

# $ . demo.sh
# Sending build context to Docker daemon   5.12kB
# Step 1/5 : FROM node:18
#  ...
# Successfully built 099898ffe290
# Successfully tagged node-1:latest
# Server 'node-1' running at http://0.0.0.0:3000/
# $ 

# volume mounting
docker volume create --name=nodeVolume

# build containers
docker build . -t node-1

# run containers
#
# if the volume had not been created explicitly, it would be created 
# automatically with the run command.
docker run \
    --mount type=volume,source=nodeVolume,target=/home \
    -p 0.0.0.0:3000:3000 \
    --name=node-volume node-1 node-volume 3000 &

# volume binding
docker run \
    --mount type=bind,source=/home/dipm,target=/home \
    -p 0.0.0.0:3001:3000 \
    --name=node-binding node-1 node-binding 3001 &