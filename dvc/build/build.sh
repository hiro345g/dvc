#! /bin/sh
IMAGE_NAME=dvc:202509
SCRIPT_DIR=$(dirname "$0")
BUILD_DEVCON_DIR=$(cd "${SCRIPT_DIR}" || exit 1;pwd)
PATH=${PATH}:${NPM_CONFIG_PREFIX}/bin

if [ "${NO_CACHE}" = "ENABLE" ]; then
    DVC_OPT="${DVC_OPT} --no-cache"
fi

cd "${BUILD_DEVCON_DIR}" || exit 1
# shellcheck disable=SC2086
npm exec --package=@devcontainers/cli -- \
    devcontainer build \
        ${DVC_OPT} \
        --workspace-folder .\
        --config ./devcontainer.json \
        --image-name ${IMAGE_NAME}

if [ "${USER_NAME}" = "" ]; then
    exit 0
fi
docker tag ${IMAGE_NAME} "${USER_NAME}/${IMAGE_NAME}"
