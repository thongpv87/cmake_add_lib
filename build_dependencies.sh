#!/usr/bin/env bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
WORKDIR=$SCRIPT_DIR/build/3rdparty
PROJECT_NAME=ffmpeg
PROJECT_GIT=https://github.com/c-ares/c-ares.git

mkdir -p ${WORKDIR}
cd ${WORKDIR}
git clone ${PROJECT_GIT} --recursive ${PROJECT_NAME}
cmake ${PROJECT_NAME} -B${PROJECT_NAME}-build -DCMAKE_INSTALL_PREFIX=${WORKDIR}
make install -C ${PROJECT_NAME}-build
