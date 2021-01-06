# static-web-server

Tiny (I mean very tiny) static web server Docker image.
Based on the excellent [lwan](https://github.com/lpereira/lwan).

![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/jveres/static-web-server)

### Build
```sh
docker build -t static-web-server .
```

### Start server
```sh
docker run --rm -p 8080:8080 -v ~/www-data:/srv static-web-server
```
