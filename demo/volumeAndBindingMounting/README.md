# About

Containers in different docker host networks can communicate between themselves, but not between networks.

# Demo

Run `demo.sh` to build a volume, a container and run the container. Write `test` to:

```shell
docker container exec -it node-volume nano /home/test.txt
```

Verify that:

```shell
sudo cat /var/lib/docker/volumes/nodeVolume/_data/test.txt
```

yields `test`. Write `test` to:

```shell
docker container exec -it node-binding nano /home/test.txt
```

Verify that:

```shell
cat ~/test.txt
```

yields `test`.

Clean resources with `clean.sh`