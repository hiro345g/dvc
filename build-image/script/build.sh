#!/bin/sh
SCRIPT_DIR=$(dirname "$0")
REPO_DIR=$(cd "${SCRIPT_DIR}/../.." || exit 1; pwd)
VERSION=202601

for t in gnpr gnr ruby python php jdk go; do
    tag="dvc:${t}-${VERSION}"
    echo $tag
    if docker image ls --format "{{.Repository}}:{{.Tag}}" | grep "${tag}" > /dev/null 2> /dev/null; then
        docker image rm "${tag}"
    fi
    if docker image ls --format "{{.Repository}}:{{.Tag}}" | grep "hiro345g/${tag}" > /dev/null 2> /dev/null; then
        docker image rm "hiro345g/${tag}"
    fi
done
tag="dvc:${VERSION}"
echo $tag
if docker image ls --format "{{.Repository}}:{{.Tag}}" | grep "${tag}" > /dev/null 2> /dev/null; then
    docker image rm "${tag}"
fi
if docker image ls --format "{{.Repository}}:{{.Tag}}" | grep "hiro345g/${tag}" > /dev/null 2> /dev/null; then
    docker image rm "hiro345g/${tag}"
fi
for t in novnc-mise novnc base; do
    tag="dvc:${t}-${VERSION}"
    echo $tag
    if docker image ls --format "{{.Repository}}:{{.Tag}}" | grep "${tag}" > /dev/null 2> /dev/null; then
        docker image rm "${tag}"
    fi
    if docker image ls --format "{{.Repository}}:{{.Tag}}" | grep "hiro345g/${tag}" > /dev/null 2> /dev/null; then
        docker image rm "hiro345g/${tag}"
    fi
done

for t in dvc-base dvc-novnc dvc-novnc-mise dvc dvc-go dvc-jdk dvc-php dvc-python dvc-ruby dvc-gnr dvc-gnpr; do
    USER_NAME=hiro345g sh "${REPO_DIR}/${t}/build/build.sh"
done
