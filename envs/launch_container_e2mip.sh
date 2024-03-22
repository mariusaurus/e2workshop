#!/bin/bash

E2WORKSHOPDIR=${HOME}/Documents/projects/e2workshop
CHACHE_PATH=${HOME}/.cache
E2WS_DATA_PATH=/media/rachel/e2ws_data

CONTAINER=nvcr.io/e5z5rmoykw68/e2_workshop/e2workshop
TAG=2401.02
RUN_CMD='bash'
PORT=8526

# do not change below
MOUNTS="-v ${E2WORKSHOPDIR}:/e2ws:rw ${MOUNTS}"
MOUNTS="-v ${CHACHE_PATH}:/root/.cache:rw ${MOUNTS}"
MOUNTS="-v ${E2WS_DATA_PATH}:/e2ws_data:ro ${MOUNTS}"
MOUNTS="-v /media/rachel/results:/one_day_data:rw ${MOUNTS}" #TODO remove

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
