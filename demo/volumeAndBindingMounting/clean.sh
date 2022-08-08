#!/bin/bash
docker stop node-binding node-volume
docker rm node-binding node-volume
docker rmi node-1
docker volume rm nodeVolume
docker rm ~/test.txt