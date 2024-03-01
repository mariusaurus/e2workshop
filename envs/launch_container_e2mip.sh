#!/bin/bash

CONT_NAME=e2workshop
TAG=2401.00
RUN_CMD='bash'

MOUNTS="-v /home/mkoch/nv_sw:/nv_sw:rw"
MOUNTS="-v /home/mkoch/Documents/playground/e2mip:/playground:rw ${MOUNTS}"

docker run \
    --shm-size=1g \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    --runtime nvidia \
    --rm \
    ${MOUNTS} \
    -it nvcr.io/e5z5rmoykw68/e2_workshop/${CONT_NAME}:${TAG} bash -c "$RUN_CMD"
# docker run \
#     --shm-size=1g \
#     --ulimit memlock=-1 \
#     --ulimit stack=67108864 \
#     --runtime nvidia \
#     --rm \
#     -v /home/mkoch/nv_sw:/nv_sw:rw \
#     -v /home/mkoch/Documents/playground/e2mip:/playground:rw \
#     -it nvcr.io/e5z5rmoykw68/e2_workshop/${CONT_NAME}:${TAG} bash -c "$RUN_CMD"
