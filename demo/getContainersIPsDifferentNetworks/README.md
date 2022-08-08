# About

Containers in different docker host networks can communicate between themselves, but not between networks.

# Demo

Run `demo.sh` to build and run the containers. Check that they're all accessible from the docker host:

```shell
$ curl http://0.0.0.0:3000
server 'node-1' says 'hello!'
$ curl http://0.0.0.0:3001
server 'node-2' says 'hello!'
$ curl http://0.0.0.0:3002
server 'node-3' says 'hello!'
$ curl http://0.0.0.0:3003
server 'node-4' says 'hello!'
```

Verify that a container can communicate with the containers in its subnet, but not with containers in an external subnet:

```shell
docker inspect node-2 | grep IPAddress
    "SecondaryIPAddresses": null,
    "IPAddress": "172.17.0.2",
            "IPAddress": "172.17.0.2",
$ docker exec node-1 curl http://172.17.0.2:3000
server 'node-2' says 'hello!'
$ docker exec node-3 curl http://172.17.0.2:3000

```


Clean resources with:

```shell
docker stop node-1 node-2 node-3 node-4
docker rm node-1 node-2 node-3 node-4
docker rmi node-1 node-2 node-3 node-4
```