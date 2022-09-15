# Docker Arti

Dockerfile of the public image [ghcr.io/tiero/arti:latest](https://github.com/orgs/tiero/packages/container/package/arti) to run Arti, the Tor implementation in Rust.

Pull the image:

```bash
$ docker pull ghcr.io/tiero/arti:latest
```

Run the image:

```bash
$ docker run -p 9050:9050 ghcr.io/tiero/arti:latest
```


Run the proxy on different port:

```bash
$ docker run -p 9150:9150 ghcr.io/tiero/arti:latest proxy -p 9150
```