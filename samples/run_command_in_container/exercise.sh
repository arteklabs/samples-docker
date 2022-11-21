#!/bin/bash
IMG=ubuntu
NAME=tmp

# download container and have executing a command
docker run --rm --name=$NAME $IMG echo hello from the docker container
docker rmi $IMG

# execute a command in a sleeping (running) container that is doing nothing 
# except waiting for commands
docker run --name=$NAME -d --rm $IMG sleep infinity
docker exec $NAME echo hello from the docker container
docker stop $NAME
docker rmi $IMG
