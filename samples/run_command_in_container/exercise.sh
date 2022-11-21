#!/bin/bash
docker run --name=tmp ubuntu echo hello from the docker container
docker rm tmp
