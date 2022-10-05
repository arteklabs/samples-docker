# About

Publish your image to the docker [lifespline/demo-docker][registry].

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