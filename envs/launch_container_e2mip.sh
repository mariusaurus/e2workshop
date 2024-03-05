#!/bin/bash

CONTAINER=nvcr.io/e5z5rmoykw68/e2_workshop/e2workshop
TAG=2401.00
RUN_CMD='bash'
PORT=8526

MOUNTS="-v /home/mkoch/nv_sw:/nv_sw:rw"
MOUNTS="-v /home/mkoch/Documents/projects/e2workshop:/e2ws:rw ${MOUNTS}"
MOUNTS="-v /home/mkoch/Documents/playground/e2mip:/playground:rw ${MOUNTS}"

docker run \
    --shm-size=1g \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    --runtime nvidia \
    --rm \
    --publish ${PORT}:${PORT} \
    ${MOUNTS} \
    -it ${CONTAINER}:${TAG} bash -c "$RUN_CMD"
