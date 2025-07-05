#!/bin/sh
docker tag dvc:202507 hiro345g/dvc:202507
docker tag dvc:go-202507 hiro345g/dvc:go-202507
docker tag dvc:jdk-202507 hiro345g/dvc:jdk-202507
docker tag dvc:php-202507 hiro345g/dvc:php-202507
docker tag dvc:python-202507 hiro345g/dvc:python-202507
docker tag dvc:ruby-202507 hiro345g/dvc:ruby-202507
docker tag dvc:gnr-202507 hiro345g/dvc:gnr-202507
docker tag dvc:gnpr-202507 hiro345g/dvc:gnpr-202507

# USER_NAME=hiro345g sh build.sh を実行すれば、タグは自動でつく。