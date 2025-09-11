#!/bin/sh
docker tag dvc:base-202509 hiro345g/dvc:base-202509
docker tag dvc:novnc-202509 hiro345g/dvc:novnc-202509
docker tag dvc:202509 hiro345g/dvc:202509
docker tag dvc:go-202509 hiro345g/dvc:go-202509
docker tag dvc:jdk-202509 hiro345g/dvc:jdk-202509
docker tag dvc:php-202509 hiro345g/dvc:php-202509
docker tag dvc:python-202509 hiro345g/dvc:python-202509
docker tag dvc:ruby-202509 hiro345g/dvc:ruby-202509
docker tag dvc:gnr-202509 hiro345g/dvc:gnr-202509
docker tag dvc:gnpr-202509 hiro345g/dvc:gnpr-202509

# USER_NAME=hiro345g sh build.sh を実行すれば、タグは自動でつく。