# About

Containers in different docker host networks can communicate between themselves, but not between networks.

# Demo

```txt
/var/lib/docker
│
├╴ containers
├╴ image
├╴ network
├╴ volumes
...
```

```txt
base
│
├╴ (image-layer-1) read-only
├╴ (image-layer-2) read-only
├╴ (image-layer-3) read-only
└╴ (container-layer) read-write
```



Run `demo.sh` to build and run the container. Check that it's accessible from the docker host:

```shell
$ curl http://0.0.0.0:3000
server 'node-1' says 'hello!'
```

Clean resources with:

```shell
docker stop node-1
docker rm node-1
docker rmi node-1
```