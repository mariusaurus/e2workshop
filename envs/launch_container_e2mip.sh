#!/bin/bash

CONTAINER=nvcr.io/e5z5rmoykw68/e2_workshop/e2workshop
TAG=2401.01
RUN_CMD='bash'
PORT=8526

MOUNTS="-v ${HOME}/nv_sw:/nv_sw:rw"
MOUNTS="-v ${HOME}/Documents/projects/e2workshop:/e2ws:rw ${MOUNTS}"
MOUNTS="-v ${HOME}/.cache:/root/.cache:rw ${MOUNTS}"

WORKDIR=/e2ws

docker run \
    --shm-size=1g \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    --runtime nvidia \
    --rm \
    --publish ${PORT}:${PORT} \
    --workdir ${WORKDIR} \
    ${MOUNTS} \
    -it ${CONTAINER}:${TAG} bash -c "$RUN_CMD"
