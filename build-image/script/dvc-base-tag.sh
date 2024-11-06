#!/bin/sh
docker tag dvc:base-202411 hiro345g/dvc:base-202411
docker tag dvc:novnc-202411 hiro345g/dvc:novnc-202411
docker tag dvc:novnc-mise-202411 hiro345g/dvc:novnc-mise-202411
docker tag dvc:novnc-go-202411 hiro345g/dvc:novnc-go-202411
docker tag dvc:novnc-jdk-202411 hiro345g/dvc:novnc-jdk-202411
docker tag dvc:novnc-php-202411 hiro345g/dvc:novnc-php-202411
docker tag dvc:novnc-python-202411 hiro345g/dvc:novnc-python-202411
docker tag dvc:novnc-ruby-202411 hiro345g/dvc:novnc-ruby-202411
docker tag dvc:novnc-gnr-202411 hiro345g/dvc:novnc-gnr-202411
docker tag dvc:novnc-gnpr-202411 hiro345g/dvc:novnc-gnpr-202411

# USER_NAME=hiro345g sh build.sh を実行すれば、タグは自動でつく。