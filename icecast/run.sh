#!/usr/bin/env bash

docker container stop icecast
docker container rm icecast
docker container create --name icecast --publish 8000:8000 icecast:latest
docker container start icecast