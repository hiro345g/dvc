#! /bin/sh
IMAGE_NAME=dvc:novnc-202509
SCRIPT_DIR=$(dirname "$0")
BUILD_DEVCON_DIR=$(cd "${SCRIPT_DIR}" || exit 1;pwd)

OPT_NO_CACHE=""
if [ "${NO_CACHE}" = "ENABLE" ]; then
    OPT_NO_CACHE="--no-cache"
    NO_CACHE="--no-cache" sh "${SCRIPT_DIR}/step1/build.sh"
else
    sh "${SCRIPT_DIR}/step1/build.sh"
fi

cd "${BUILD_DEVCON_DIR}" || exit 1
docker compose build ${OPT_NO_CACHE}

if [ "${USER_NAME}" = "" ]; then
    exit 0
fi
docker tag ${IMAGE_NAME} "${USER_NAME}/${IMAGE_NAME}"
