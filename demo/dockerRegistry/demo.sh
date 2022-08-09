#!/bin/bash

# $ . demo.sh
# Sending build context to Docker daemon   5.12kB
# Step 1/5 : FROM node:18
#  ...
# Successfully built 099898ffe290
# Successfully tagged node-1:latest
# Server 'node-1' running at http://0.0.0.0:3000/
# $ 

registry="lifespline/demo-docker"

# build containers
docker build . -t ${registry}

# push image
docker push ${registry}:latest

# delete local image
docker rmi ${registry}:latest

# pull image from registry
docker pull ${registry}:latest

# run container
docker run -p 0.0.0.0:3000:3000 --name=node-1 ${registry} node-1 3000 &
