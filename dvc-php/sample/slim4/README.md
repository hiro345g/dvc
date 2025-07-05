# slim4

dvc-php 開発コンテナーで Slim4 の次のドキュメントに従ってサンプルを作成しました。

- <https://www.slimframework.com/docs/v4/start/installation.html>

dvc-php 開発コンテナーの使用例として参考にしてください。

簡単に行った作業について手順を説明します。

## slim4 アプリの作成

```console
mkdir /home/node/workspace/html/slim4
cd /home/node/workspace/html/slim4
mise install php 8.2.25
mise use php@8.2.25
composer require slim/slim:"4.*"
composer require slim/psr7
```

次に `/home/node/workspace/html/slim4/public/index.php` を作成（`slim4/public/index.php` にあるもの）

## ビルトイン Web サーバーで動作確認

開発コンテナー内で `php` のビルトイン Web サーバーを起動。

```console
cd public/
php -S localhost:8888
```

開発コンテナー内で <http://127.0.0.1:8888/> へアクセスして `Hello world!` が表示されたら成功。

```console
$ curl -w'\n' http://127.0.0.1:8888/
Hello world!
```

`php` のビルトイン Web サーバーは `Ctrl+C` で停止。

Docker ホストからアクセスするには、開発コンテナー内で `0.0.0.0:8888` で起動。

```console
php -S 0.0.0.0:8888
```

Docker ホストから <http://127.0.0.1:8888/> へアクセスして `Hello world!` が表示されたら成功。

```console
$ curl -w'\n' http://127.0.0.1:8888/
Hello world!
```

## php-apache2 で動作確認

通常の PHP アプリは apache2 などで動作させるので、そのための環境を用意。
`slim4/public/index.php` へ `$app->setBasePath('/slim4');` を追加

```php
// 略
$app = AppFactory::create();
$app->setBasePath('/slim4');
// 略
```

それから `slim4/.htaccess` と `slim4/public/.htaccess` ファイルの用意。

```console
cd ..

cat << EOS > .htaccess
RewriteEngine on
RewriteRule ^$ public/ [L]
RewriteRule (.*) public/$1 [L]
EOS

cat << EOS > public/.htaccess
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [QSA,L]
EOS
```

php-apache 用イメージのビルド。

```console
sh /php-apache/build/build.sh
```

php-apache コンテナー起動。

```console
sh /php-apache/script/up.sh
```

<http://php-apache/slim4/> へアクセスして `Hello world!` が表示されたら成功

```console
$ curl -w'\n' http://php-apache/slim4/
Hello world!
```

動作確認したら php-apache コンテナー停止。

```console
sh /php-apache/script/down.sh
```
