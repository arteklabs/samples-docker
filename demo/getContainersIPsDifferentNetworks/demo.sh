#!/bin/bash

# $ . demo.sh
# Sending build context to Docker daemon   5.12kB
# Step 1/5 : FROM node:18
#  ...
# Successfully built 099898ffe290
# Successfully tagged node-4:latest
# Server 'node-4' running at http://0.0.0.0:3003/
# Server 'node-3' running at http://0.0.0.0:3002/
# Server 'node-2' running at http://0.0.0.0:3001/
# Server 'node-1' running at http://0.0.0.0:3000/
# $ 

CIDR_SUBNET="182.18.0.0/16"
NETWORK_NAME="demoNetworkBridge"
# create network
docker network create \
    --driver bridge \
    --subnet ${CIDR_SUBNET} \
    ${NETWORK_NAME}

docker network ls | grep ${NETWORK_NAME}

# build containers
docker build . -t node-1
docker build . -t node-2

docker build . -t node-3
docker build . -t node-4

# run containers
docker run -p 0.0.0.0:3000:3000 --name=node-1 node-1 node-1 3000 &
docker run -p 0.0.0.0:3001:3000 --name=node-2 node-2 node-2 3001 &

docker run -p 0.0.0.0:3002:3000 --name=node-3 --network=${NETWORK_NAME} \
    node-3 node-3 3002 &
docker run -p 0.0.0.0:3003:3000 --name=node-4 --network=${NETWORK_NAME} \
    node-4 node-4 3003 &