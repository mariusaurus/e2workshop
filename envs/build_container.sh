#!/bin/bash

CONT_NAME=e2workshop
TAG=2401.02

docker build -t nvcr.io/e5z5rmoykw68/e2_workshop/${CONT_NAME}:${TAG} -f Dockerfile .