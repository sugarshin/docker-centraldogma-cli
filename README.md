# docker-centraldogma-cli

![GitHub Actions](https://github.com/sugarshin/docker-centraldogma-cli/actions/workflows/build-and-push.yml/badge.svg)
[![Docker Version](https://img.shields.io/docker/v/sugarshin/centraldogma-cli)](https://hub.docker.com/r/sugarshin/centraldogma-cli)
[![Docker Pull](https://img.shields.io/docker/pulls/sugarshin/centraldogma-cli)](https://hub.docker.com/r/sugarshin/centraldogma-cli)

> https://github.com/line/centraldogma-go

## Usage

```sh
docker run -it --rm sugarshin/centraldogma-cli:latest \ # or ghcr.io/sugarshin/centraldogma-cli:latest
  --connect "${CENTRALDOGMA_HOST}" \
  --token "${CENTRALDOGMA_TOKEN}" \
  ls
```
