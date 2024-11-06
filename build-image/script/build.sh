#!/bin/sh
SCRIPT_DIR=$(dirname "$0")
REPO_DIR=$(cd "${SCRIPT_DIR}/../.." || exit 1; pwd)
VERSION=202411

for t in novnc-gnpr novnc-gnr novnc-ruby novnc-python novnc-php novnc-jdk novnc-go novnc-mise novnc base; do
    tag="dvc:${t}-${VERSION}"
    echo $tag
    if docker image ls | grep "${tag}" > /dev/null 2> /dev/null; then
        docker image rm "${tag}"
    fi
    if docker image ls | grep "hiro345g/${tag}" > /dev/null 2> /dev/null; then
        docker image rm "${tag}"
    fi
    docker image rm "hiro345g/${tag}"
done

for t in dvc-base dvc-novnc dvc-novnc-mise dvc-novnc-go dvc-novnc-jdk dvc-novnc-php dvc-novnc-python dvc-novnc-ruby dvc-novnc-gnr dvc-novnc-gnpr; do
    USER_NAME=hiro345g sh "${REPO_DIR}/${t}/build/build.sh"
done
