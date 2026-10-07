#!/bin/sh
docker tag dvc:base-202610 hiro345g/dvc:base-202610
docker tag dvc:novnc-202610 hiro345g/dvc:novnc-202610
docker tag dvc:novnc-mise-202610 hiro345g/dvc:novnc-mise-202610
docker tag dvc:202610 hiro345g/dvc:202610
docker tag dvc:go-202610 hiro345g/dvc:go-202610
docker tag dvc:jdk-202610 hiro345g/dvc:jdk-202610
docker tag dvc:php-202610 hiro345g/dvc:php-202610
docker tag dvc:python-202610 hiro345g/dvc:python-202610
docker tag dvc:ruby-202610 hiro345g/dvc:ruby-202610
docker tag dvc:gnr-202610 hiro345g/dvc:gnr-202610
docker tag dvc:gnpr-202610 hiro345g/dvc:gnpr-202610

# USER_NAME=hiro345g sh build.sh を実行すれば、タグは自動でつく。