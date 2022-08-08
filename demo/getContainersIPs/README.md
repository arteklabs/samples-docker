# About

The demo introduces you to subnets.

# Demo

Run `demo.sh` to build and run the containers. Check that they all have different IPs in the range `172.17.0.2-172.17.0.127`:

```shell
docker exec <container-1-id> ip addr | grep global
   inet 172.17.0.3/16 brd 172.17.255.255 scope global eth0
docker exec <container-2-id> ip addr | grep global
    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
docker exec <container-3-id> ip addr | grep global
    inet 172.17.0.4/16 brd 172.17.255.255 scope global eth0
```

Clean resources with:

```shell
docker stop <container-1-id> <container-2-id> <container-3-id>
docker rm <container-1-id> <container-2-id> <container-3-id>
docker rmi <image-1-id> <image-2-id> <image-3-id>
```