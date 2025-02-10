#!/bin/sh
docker tag dvc:base-202502 hiro345g/dvc:base-202502
docker tag dvc:novnc-202502 hiro345g/dvc:novnc-202502
docker tag dvc:novnc-mise-202502 hiro345g/dvc:novnc-mise-202502
docker tag dvc:novnc-go-202502 hiro345g/dvc:novnc-go-202502
docker tag dvc:novnc-jdk-202502 hiro345g/dvc:novnc-jdk-202502
docker tag dvc:novnc-php-202502 hiro345g/dvc:novnc-php-202502
docker tag dvc:novnc-python-202502 hiro345g/dvc:novnc-python-202502
docker tag dvc:novnc-ruby-202502 hiro345g/dvc:novnc-ruby-202502
docker tag dvc:novnc-gnr-202502 hiro345g/dvc:novnc-gnr-202502
docker tag dvc:novnc-gnpr-202502 hiro345g/dvc:novnc-gnpr-202502

# USER_NAME=hiro345g sh build.sh を実行すれば、タグは自動でつく。