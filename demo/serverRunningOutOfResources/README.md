# About

Installing docker installs:

+ `docker daemon`: background process that amnasges docker obejcts like images, containers, volumes, networks, etc.
+ `REST API server`: REST API interface that programs use to talk to the docker daemon
+ `docker CLI`: CLI, which does not need to exist on the same host that has installed the `docker daemon`, see: `docker -H=<remote-docker-engine>:<port>`

# Demo

Authenticate with the registry:

```shell
$ docker login docker.io/lifespline/demo-docker
Username: lifespline
Password:
```

Run `demo.sh` to build, publish and pull the image. Test that:

```shell
$ curl http://0.0.0.0:3000
server 'node-1' says 'hello!'
```

Clean resources with `clean.sh`

[registry]: https://hub.docker.com/repository/docker/lifespline/demo-docker "Dockerhub Lifespline Registry"