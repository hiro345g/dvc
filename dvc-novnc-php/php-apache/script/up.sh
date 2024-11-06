#!/bin/sh
SCRIPT_DIR=$(dirname "$0")
PHP_APACHE_DIR=$(cd "${SCRIPT_DIR}/.." || exit 1;pwd)

docker compose -f "${PHP_APACHE_DIR}/compose.yaml" up -d
