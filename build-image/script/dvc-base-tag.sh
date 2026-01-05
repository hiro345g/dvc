#!/bin/sh
docker tag dvc:base-202601 hiro345g/dvc:base-202601
docker tag dvc:novnc-202601 hiro345g/dvc:novnc-202601
docker tag dvc:202601 hiro345g/dvc:202601
docker tag dvc:go-202601 hiro345g/dvc:go-202601
docker tag dvc:jdk-202601 hiro345g/dvc:jdk-202601
docker tag dvc:php-202601 hiro345g/dvc:php-202601
docker tag dvc:python-202601 hiro345g/dvc:python-202601
docker tag dvc:ruby-202601 hiro345g/dvc:ruby-202601
docker tag dvc:gnr-202601 hiro345g/dvc:gnr-202601
docker tag dvc:gnpr-202601 hiro345g/dvc:gnpr-202601

# USER_NAME=hiro345g sh build.sh を実行すれば、タグは自動でつく。