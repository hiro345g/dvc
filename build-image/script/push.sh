#!/bin/sh
VERSION=202602
USER_NAME=hiro345g
docker push ${USER_NAME}/dvc:base-${VERSION}
docker push ${USER_NAME}/dvc:novnc-${VERSION}
docker push ${USER_NAME}/dvc:novnc-mise-${VERSION}
docker push ${USER_NAME}/dvc:${VERSION}
docker push ${USER_NAME}/dvc:go-${VERSION}
docker push ${USER_NAME}/dvc:jdk-${VERSION}
docker push ${USER_NAME}/dvc:php-${VERSION}
docker push ${USER_NAME}/dvc:python-${VERSION}
docker push ${USER_NAME}/dvc:ruby-${VERSION}
docker push ${USER_NAME}/dvc:gnr-${VERSION}
docker push ${USER_NAME}/dvc:gnpr-${VERSION}
