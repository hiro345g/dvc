#!/bin/sh
docker tag dvc:base-202507 hiro345g/dvc:base-202507
docker tag dvc:novnc-202507 hiro345g/dvc:novnc-202507
docker tag dvc:novnc-mise-202507 hiro345g/dvc:novnc-mise-202507
docker tag dvc:novnc-go-202507 hiro345g/dvc:novnc-go-202507
docker tag dvc:novnc-jdk-202507 hiro345g/dvc:novnc-jdk-202507
docker tag dvc:novnc-php-202507 hiro345g/dvc:novnc-php-202507
docker tag dvc:novnc-python-202507 hiro345g/dvc:novnc-python-202507
docker tag dvc:novnc-ruby-202507 hiro345g/dvc:novnc-ruby-202507
docker tag dvc:novnc-gnr-202507 hiro345g/dvc:novnc-gnr-202507
docker tag dvc:novnc-gnpr-202507 hiro345g/dvc:novnc-gnpr-202507

# USER_NAME=hiro345g sh build.sh を実行すれば、タグは自動でつく。