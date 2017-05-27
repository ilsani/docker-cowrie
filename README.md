# docker-cowrie

Official repo: [https://github.com/micheloosterhof/cowrie](https://github.com/micheloosterhof/cowrie)

## Build docker image
```
$ git clone https://github.com/ilsani/docker-cowrie
$ docker build -t cowrie .
```
to check if docker builded the image:
```
$ docker images
```

## Run docker container
```
$ docker run -it -p 2222:2222 -p 2223:2223 cowrie
```
to interact with this new docker container:
```
docker ps
docker exec -it <CONTAINER_ID> bash
```

## Port redirection
The following firewall rule will forward incoming traffic on port 22 to port 2222.
```
$ sudo iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 2222
$ sudo iptables -t nat -A PREROUTING -p tcp --dport 23 -j REDIRECT --to-port 2223
```