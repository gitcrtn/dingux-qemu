#!/usr/bin/env bash
docker run --rm -it -v $PWD:/pwd --entrypoint /pwd/build_fs.sh ubuntu:12.04

