#!/bin/bash

# provide path to code, to data, container and choose a port number different from you colleagues
E2WORKSHOPDIR= # /absolute/path/to/workshop/directory/e2workshop
E2WS_DATA_PATH= # /absolute/path/to/data/directory/e2ws_data
CONTAINER= # name of container, e.g. nvcr.io/e5z5rmoykw68/e2_workshop/e2workshop
PORT= # choose a port number which is not used by any of your colleagues, smth like 8765

# do not change below
TAG=latest
RUN_CMD='bash'

MOUNTS="-v ${E2WORKSHOPDIR}:/e2ws:rw ${MOUNTS}"
MOUNTS="-v ${E2WS_DATA_PATH}/earth2mip_cache:/root/.cache/earth2mip:rw ${MOUNTS}"
MOUNTS="-v ${E2WS_DATA_PATH}/cwa_data:/cwa_data:ro ${MOUNTS}"
MOUNTS="-v ${E2WS_DATA_PATH}/corrdiff_checkpoints:/corrdiff_checkpoints:ro ${MOUNTS}"

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
