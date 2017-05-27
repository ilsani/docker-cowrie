# docker-cowrie

Official repo: [https://github.com/micheloosterhof/cowrie](https://github.com/micheloosterhof/cowrie)

## Setup docker container
```
https://github.com/ilsani/docker-cowrie
```
```
docker build -t cowrie .
```

## Port redirection
The following firewall rule will forward incoming traffic on port 22 to port 2222.
```
sudo iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 2222
sudo iptables -t nat -A PREROUTING -p tcp --dport 23 -j REDIRECT --to-port 2223
```