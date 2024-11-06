#!/bin/sh
VERSION=202411
USER_NAME=hiro345g
docker push ${USER_NAME}/dvc:base-${VERSION}
docker push ${USER_NAME}/dvc:novnc-${VERSION}
docker push ${USER_NAME}/dvc:novnc-go-${VERSION}
docker push ${USER_NAME}/dvc:novnc-jdk-${VERSION}
docker push ${USER_NAME}/dvc:novnc-php-${VERSION}
docker push ${USER_NAME}/dvc:novnc-python-${VERSION}
docker push ${USER_NAME}/dvc:novnc-ruby-${VERSION}
docker push ${USER_NAME}/dvc:novnc-gnr-${VERSION}
docker push ${USER_NAME}/dvc:novnc-gnpr-${VERSION}
