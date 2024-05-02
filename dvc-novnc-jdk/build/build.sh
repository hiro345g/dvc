#! /bin/sh
IMAGE_NAME=dvc:novnc-jdk-202405
BUILD_DEVCON_DIR=$(cd $(dirname $0);pwd)
PATH=${PATH}:${NPM_CONFIG_PREFIX}/bin

OPT_NO_CACHE=""
if [ "x${NO_CACHE}" = "xENABLE" ]; then
    OPT_NO_CACHE="--no-cache"
fi

cd ${BUILD_DEVCON_DIR}
npm exec --package=@devcontainers/cli -- \
    devcontainer build \
        ${OPT_NO_CACHE} \
        --workspace-folder .\
        --config ./devcontainer.json \
        --image-name ${IMAGE_NAME}

if [ "x${USER_NAME}" = "x" ]; then
    exit 0
fi
docker tag ${IMAGE_NAME} ${USER_NAME}/${IMAGE_NAME}