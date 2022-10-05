#!/bin/bash
docker stop node-1 node-2 node-3 node-4
docker rm node-1 node-2 node-3 node-4
docker rmi node-1 node-2 node-3 node-4
docker network rm demoNetworkBridge