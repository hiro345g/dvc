#!/bin/sh
#
# dvc-novnc から用意した dvc-novnc-mozc 用のコンテナー起動用ディレクトリを用意するためのスクリプト
#
DIR_NAME=$(dirname "$0")
BASE_DIR=$(cd "${DIR_NAME}/.." || exit 1;pwd)
DEV_DIR=${BASE_DIR}/dev
DIST_DIR=${BASE_DIR}/dvc-novnc-mozc

if [ ! -e "${DEV_DIR}/dvc-novnc" ]; then
  cd "${DEV_DIR}/" || exit 1
  wget https://github.com/hiro345g/dvc/archive/refs/heads/main.zip
  unzip "${DEV_DIR}/"main.zip
  mv "${DEV_DIR}/"dvc-main/dvc-novnc "${DEV_DIR}/"dvc-novnc
  rm "${DEV_DIR}/"main.zip
fi
if [ ! -e "${DIST_DIR}/".devcontainer ]; then mkdir -p "${DIST_DIR}/".devcontainer; fi
if [ ! -e "${DIST_DIR}/"workspace_share ]; then mkdir -p "${DIST_DIR}/"workspace_share; fi
cp -r "${DEV_DIR}/"dvc-novnc/.devcontainer/* "${DIST_DIR}/".devcontainer/
cp -r "${DEV_DIR}/"dvc-novnc/compose.yaml "${DIST_DIR}/"
sed -i 's/dvc-novnc/dvc-novnc-mozc/' "${DIST_DIR}/".devcontainer/devcontainer.json
sed -i 's/dvc-novnc/dvc-novnc-mozc/' "${DIST_DIR}/"compose.yaml

rm -fr "${DEV_DIR}/"dvc-novnc
