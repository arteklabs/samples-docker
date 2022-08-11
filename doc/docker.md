- docker: build an image?
  - utility: 1
  - solution: `docker build . -t <tag> -f <path>/Dockerfile`
- docker: list all images
	- solution: docker image ls
- docker: what is a docker base image?
	- solution: TODO
- dockerhub: push docker image to dockerhub
	- sign up
	- create repository
	- create dockerfile for docker image
	- docker build -t lifespline/pyton-executor .
	- docker run lifespline/utils:pyton-executor
	- docker login -u ldocker login -u $USR -p $PSSWORD
	- docker push lifespline/utils:pyton-executor
- docker: What is the **docker architecture**?
  - solution:
    +  Docker ``client`` talks to the Docker ``daemon`` (`dockerd`). The `client` is local, the `daemon` is either local or remote. The `client` can communicate with more than one `daemon`.
       +  `docker-client` -request-> `docker-daemon` <-spin-image-container-> `docker-daemon` -request-> `docker-registry`
       +  request:
          +  build
          +  pull
          +  run
          +  create
          +  stop
          +  delete
          +  move
    +  daemon **builds**, **runs** and **distributes** the docker containers
    +  docker client and daemon communicate either with:
       +  network interface
       +  UNIX sockets
       +  REST API
    + a docker client can also be a **docker compose** that enables you to control a set of containers
    + a **docker registry** stores docker images.
    + **docker objects**:
      + image: instructions for creating a `container` (`Dockerfile`)
      + container
        + runnable instance of an `image`
        + attached to **one-or-more** `networks`
        + attached to persistent `storage`
        + create new `images` based on its' current ``state``
      + network
      + volume
      + plugin
      + *etc.*
- docker: list images?
  - solution:
	```python
	>>> docker images	
	REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
	busybox       latest    1a80408de790   2 weeks ago    1.24MB
	hello-world   latest    feb5d9fea6a5   7 months ago   13.3kB
	```
- docker: **pull** image from **registry**?
  - solution:
  	```python
	>>> docker pull	
	Using default tag: latest
	latest: Pulling from library/busybox
	Digest: sha256:d2b53584f580310186df7a2055ce3ff83cc0df6caacf1e3489bff8cf5d0af5d8
	Status: Image is up to date for busybox:latest
	docker.io/library/busybox:latest
	```
- docker: run container?
	- solution:
	```shell
	>>> docker run busybox echo "hello from busybox"
	hello from busybox
	```
- docker: show running containers? show all ran containers?
  - solution: 
	```shell
	>>> docker ps
	CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
	>>> docker ps -a
	CONTAINER ID   IMAGE         COMMAND                  CREATED             STATUS                         PORTS     NAMES
	84b86abe73a8   busybox       "echo 'hello from bu…"   About an hour ago   Exited (0) About an hour ago             infallible_vaughan
	fc19efffadba   busybox       "sh"                     About an hour ago   Exited (0) About an hour ago             stupefied_wozniak
	0cd559e8c316   hello-world   "/hello"                 2 days ago          Exited (0) 2 days ago                    distracted_beaver
	```
- docker: attach to tty in the container?
  + solution:
	```shell
	>>> docker run -it busybox sh
	/ # whoami
	root
	/ # exit
	```
- docker: if you attach your process to a tty in a container and you delete the ``/bin`` in the container, what will happen to commands like `ls` in the container when you run it again?
  + solution: they will still be there because **the container is destroyed on exiting** and **recreated on running**.
- docker: what happens to the containers after they are exited?
  + solution: they remain in memory. Remove them with `docker rm <container-id>`
- docker: difference between `docker images` and `docker ps -a`?
  + solution: `docker images` lists the pulled **images** from the registry, `docker ps -a` lists the created/running containers based on those images.
- docker: **remove** all **exited** containers (one liner)?
  - utility: 5
  - solution: `docker rm $(docker ps -a -q -f status=exited)`
- docker: remove all images and containers:
  - utility: 7
  - solution:
	```sh
	docker stop $(docker ps -qa)
	docker rm -f $(docker ps -qa)
	docker rmi -f $(docker images -aq)
	```
- docker: What is the difference between `RUN` and `CMD`?
  + solution: ``RUN`` is an **image build step**, the state of the container after a RUN command will be committed to the container image. A Dockerfile can have many RUN steps that layer on top of one another to build the image. ``CMD`` is the **command the container executes by default** when you **launch** the built image
- docker: **delete images**?
  + solution: ``docker image rm <image-id>``
- docker: delete all docker images (one-liner)
  + solution: `docker image rm -f $(docker image ls -q)`
- docker: tutorial
  - solution:
	`container`: it is only supposed to live as long as the process it hosts is running. A process ranges from an `echo` to hosting a server.

	Runs the docker image `<image>` version `<version>` if it exists in the `docker host`. Otherwise, it will pull the image from the docker registry, and run it in a `container`.
	```sh
	docker run <image>:<version>

	docker run ubuntu:latest
	docker run ubuntu:20.04
	```

	Lists all the `running containers` in the docker host:
	```sh
	docker ps
	```

	Lists all the `containers` in the docker host:
	```sh
	docker ps -a
	```

	Stop a running container:
	```sh
	docker stop <container-id>|<container-name>
	```

	Remove a `stopped` or `exited` container permanently:
	```sh
	docker rm <image-id>
	```

	List all `image` in the docker host:
	```sh
	docker images
	```


	Delete an `image` from the docker host (the `image` cannot have a `container` associated to it):
	```sh
	docker rmi <image-repository>|<image-id>
	```

	Pull an image to the docker host without running in in a container:
	```sh
	docker pull <image-name>:latest
	```

	Run a container with a process:
	```sh
	docker run ubuntu sleep 10

	docker run <image> <command>
	```

	Running a process on a container:
	```sh
	docker exec <container-id> <command>

	docker exec ubuntu sleep 100
	```

	Run an image in a container in `detach` mode (`bg`):
	```sh
	docker run -d <image>

	$ docker run -d ubuntu sleep 100
	8bf3d7e479a5a45f7dccecaa625f79b8960631a2520fb0f98b8c21c29ff2b08d
	$ docker ps
	CONTAINER ID   IMAGE     COMMAND      CREATED         STATUS         PORTS     NAMES
	8bf3d7e479a5   ubuntu    "sleep 10"   5 seconds ago   Up 5 seconds             eloquent_mclaren
	```

	Attach to a container in `detach` mode (`bg`):
	```sh
	docker run -d <image>

	$ docker run -d ubuntu sleep 100
	8bf3d7e479a5a45f7dccecaa625f79b8960631a2520fb0f98b8c21c29ff2b08d
	$ docker attach <container-id>|<container-name>
	
	```

	Map your `stdin` to the container's `stdin`, i.e., run a `container` in the `interactive` mode:
	```sh
	docker run -i <image>
	whoami
	root
	```

	Run a `container` in the `interactive` mode with a sudo terminal:
	```sh
	docker run -i -t <image>
	whoami
	root

	docker run -it <image>
	```

	Build a docker container with a node server listenning on port `localhost:3000`, and map the docker host's free ports `3001`, `3002`, ... to `3000`.

	`app.js`
	```javascript
	// run with:
	// 
	// $ node app.js
	// Server running at http://localhost:3000/
	//
	// test with:
	//
	// $ curl http://localhost:3000
	// Hello from node server
	const http = require('http');

	const hostname = '0.0.0.0';
	const port = 3000;

	const server = http.createServer((req, res) => {
	res.statusCode = 200;
	res.setHeader('Content-Type', 'text/plain');
	res.end('Hello from server\n');
	});

	server.listen(port, hostname, () => {
	console.log(`Server running at http://${hostname}:${port}/`);
	});
	```

	`Dockerfile`
	```Dockerfile
	# build with:
	#
	# $ docker build . -t demo
	# Sending build context to Docker daemon  3.072kB
	# Step 1/3 : ...
	# ...
	# Successfully built f5ec734f0d16
	# Successfully tagged demo:latest
	# 
	# run with:
	#
	# $ docker run demo
	# Server running at http://0.0.0.0:3000/
	# 
	# stop with:
	#
	# $ docker stop 012a0f5aae62
	FROM node:18
	COPY app.js  ./	
	CMD ["node", "app"]
	```

	Map the ports:

	```sh
	docker run -p <local-host-IP>:<local-host-port>:<container-port>
	```

	Map the `container` file system to the local file system:

	```sh
	$ docker run -v <local-path>:<container-path> -it ubuntu
	root@e4c8f8f8f8f8:/# echo test > home/from_container.md
	```

	```sh
	$ cat <local-path>/from_container.md
	test
	```

	See logs in container:

	```sh
	$ docker logs <container-id>
	```
	
	Pass environment variables to containers:

	```sh
	$ docker run -e <key>=<value> <image>
	```

	Inspect the environment variables of a container:

	```sh
	$ docker inspect <container-id>
	[
		{
			"Id": "<hash>",
			...
		}
	]
	```

	Inspect the layers of a container:

	```sh
	$ docker history <container-id>
	```

	`build` a `container` from an `image`:

	```sh
	docker build . -t <image-tag>
	```

	Define the command a docker image excutes by default (but that can be overwritten):

	```Dockerfile
	FROM ubuntu
	CDM <command>

	FROM ubuntu
	CDM ["whoami"]
	# $ docker build . -t demo
	# $ docker run demo
	# root
	# $ docker run demo echo hi
	# hi
	```

	To prevent the default command from being overwritten, specify it with (in this case, only the parameter to sleep is overwritten):

	```Dockerfile
	FROM ubuntu
	CDM <command>

	FROM ubuntu
	ENTRYPOINT ["sleep"]
	CMD ["5"]
	# $ docker build . -t demo
	# $ docker run demo
	# $ docker run demo 1
	```

	But it is still possible to overwrite it entirely:

	```sh
	$ docker run --entrypoint whoami demo
	root
	```

	Docker host default networks:
	+ `bridge` (default): private network on the host, all containers get an IP in this private network `172.17.0.2-172.17.0.127` (`172.17.0.1` is the `docker0`). Containers can communicate with each other in the private network: `docker run`
	+ `none`: `docker run --network=none`
	+ `host`: `docker run --network=host`
- docker: list docker host networks
  - utility: 1
  - solution:
	```shell
	$ docker network ls
	NETWORK ID     NAME      DRIVER    SCOPE
	a9a1d8c7da35   bridge    bridge    local
	add2d7fc6e08   host      host      local
	f7b9f230fe4b   none      null      local
	```
- docker: create docker host network
  - utility: 1
  - solution:
	```shell
	$ docker network create \
		--driver=bridge \
		--subnet=<CIDRBLOCK>
	```
- docker: list running docker containers in docker host
  - utility: 1
  - solution:
	```shell
	$ docker ps
	```
- docker: list all docker containers in docker host
  - utility: 1
  - solution:
	```shell
	$ docker ps -a
	```
- docker: list all docker containers ids in docker host
  - utility: 1
  - solution:
	```shell
	$ docker ps -aq
	```
  - source:
    - https://www.youtube.com/watch?v=zJ6WbK9zFpI
- docker: check container IP address
  - utility: 1
  - solution:
	```sh
	# the instructions below could be pre-installed in the docker image
	$ docker exec <container-id> apt update
	$ docker exec <container-id> apt install -y iproute2
	$ docker exec <container-id> ip addr | grep global
	    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
	```
- docker: inspect a container's IP address in the docker host
  - utility: 1
  - solution:
	```sh
	$ docker inspect <container-id> | grep \"IPAddress\"
		"IPAddress": "172.17.0.2",
				"IPAddress": "172.17.0.2",
	```
- docker: what is the address of the DNS server in the docker host?
  - utility: 1
  - solution:
	```sh
	127.0.0.11
	```
- docker: when a `container` is stopped, what happens to its state?
  - utility: 1
  - solution: it is wipped
- docker: attach to a running container with a terminal:
  - utility: 1
  - solution:
	```sh
	docker container exec -it <container-id/name> bash
	```
- docker: tag and untag image?
  - utility: 1
  - solution:
	```shell
	docker tag <image> <new-tag>
	docker rmi <new-tag>
	```
- docker: difference between `run` and `start`?
  - utility: 1
  - solution: `run` creates a new container, `start` starts an existing container.
- docker: log a docker container?
  - utility: 1
  - solution: `docker logs <container-id>`
