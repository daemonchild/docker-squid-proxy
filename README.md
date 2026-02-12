# docker-squid-proxy
## Web Proxy for PenTesting

This is a lightweight Squid based proxy for bouncing traffic, ideal for use during a pentest. 
It is based on Ubuntu and is a <400Mb image.

You may wish to edit squid.conf to restrict to specific source and destination networks. The default configuration allow connections to RFC1918 addresses as shown here, but this comment can easily be removed to restrict access.

```
# Deny Some Bad Things
http_access deny !Safe_ports
# http_access deny RFC1918               # comment out for internal deployments
http_access deny CONNECT !SSL_ports
```

**Note that authentication is not provided with the default configuration. Do NOT put this live on the Internet!**

You can pass parameters to Squid if required.


## Prebuilt Image

I have uploaded a prebuilt image to the Docker Hub using the configuration as provided. You can pull the image as follows:

```
docker pull daemonchild/docker-squid-proxy:latest
```

Latest is version 1.2.

### Versions
| Version | Ubuntu Version | Size on Disk | Notes |
|---|---|---|---|
| 1.0 | 16.04 | 293MB | Does NOT allow to RFC1918 addresses |
| 1.1 | 16.04 | 293MB | Does allow to RFC1918 addresses |
| 1.2 | 24.04 | 386MB | Does allow to RFC1918 addresses |

Image URL on Docker Hub: https://hub.docker.com/repository/docker/daemonchild/docker-squid-proxy/

## To Run

```
docker run -d --name docker-squid-proxy -p 3128:3128/tcp daemonchild/docker-squid-proxy:latest
```


## To Build Your Own Version

Modify conf/squid.conf, then from the container directory:
```
docker build -t docker-squid-proxy-modified .
```

To run your version:
```
docker run -d --name docker-squid-proxy -p 3128:3128/tcp docker-squid-proxy-modified
```
