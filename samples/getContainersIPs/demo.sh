#!/bin/bash

# $ . demo.sh
# Sending build context to Docker daemon   5.12kB
# Step 1/5 : FROM node:18
#  ...
# Successfully built 099898ffe290
# Successfully tagged demo-subnet-1:latest
# Sending build context to Docker daemon   5.12kB
# Step 1/5 : FROM node:18
#  ...
# Successfully built 099898ffe290
# Successfully tagged demo-subnet-2:latest
# Sending build context to Docker daemon   5.12kB
# Step 1/5 : FROM node:18
#  ...
# Successfully built 099898ffe290
# Successfully tagged demo-subnet-3:latest
# Server running at http://0.0.0.0:3000/
# Server running at http://0.0.0.0:3000/
# Server running at http://0.0.0.0:3000/
# $ 

# build containers
docker build . -t demo-subnet-1
docker build . -t demo-subnet-2
docker build . -t demo-subnet-3

# run containers
docker run --rm -d --name demo-subnet-1 demo-subnet-1
docker run --rm -d --name demo-subnet-1 demo-subnet-2
docker run --rm -d --name demo-subnet-1 demo-subnet-3