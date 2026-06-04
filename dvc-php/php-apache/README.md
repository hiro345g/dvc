# php-apache

## ビルド

php-apache 用のイメージをビルドするには次のコマンドを実行します。

```console
sh build/build.sh
```

シェルが使えない環境では `docker compose build` コマンドを使ってビルドします。ビルドが終わったら元のフォルダに戻ります。

```console
cd build
docker compose build
cd ..
```

カスタマイズする場合は、build にある Dockerfile や関連ファイルを修正して使います。

## 起動

```console
sh script/up.sh
```

シェルが使えない環境では `docker compose up` コマンドを使います。

```console
docker compose up
```

## 停止

```console
sh script/down.sh
```

シェルが使えない環境では `docker compose down` コマンドを使います。

```console
docker compose -p php-apache down
```
