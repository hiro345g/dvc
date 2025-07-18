# dvc-php/sample

これは、dvc-php の開発コンテナー内で動作確認をするときに使用した PHP のサンプル。

この開発コンテナー dvc-php では、`dvc-php:/home/node/workspace/php/html` に PHP のアプリを配備して開発する前提で、各種のファイルを用意してあります。

## 開発コンテナー用イメージのビルド

dvc-php ディレクトリーを `${PROJ_DIR}` とします。開発コンテナー用イメージのビルドにはスクリプト `build/build.sh` を実行します。

```consonle
cd ${PROJ_DIR}
sh build/build.sh
```

次に、PHP プログラムをデバッグ実行するときに通過う Apache 用コンテナーのための Docker イメージである php-apache のイメージについて、`${PROJ_DIR}/php-apache/README.md` を参照して作成します。

## 開発環境の用意

Docker イメージの用意ができたら dvc-php を開発コンテナーとして起動します。VS Code をアタッチした画面が表示されたら、Docker ホストのターミナルでサンプルのファイルをコピーします。

```console
cd ${PROJ_DIR}
docker compose -p dvc-php exec dvc-php sh -c 'if [ ! -e /home/node/workspace/php ]; then mkdir /home/node/workspace/php; fi'
docker compose -p dvc-php cp sample/html dvc-php:/home/node/workspace/php/html
docker compose -p dvc-php cp sample/html.code-workspace dvc-php:/home/node/workspace/php/html.code-workspace
```

それから、VS Code をアタッチした dvc-php で `/home/node/workspace/php/html.code-workspace` を開きます。

```console
code /home/node/workspace/php/html.code-workspace
```

## デバッグ実行の動作確認

html ワークスペースを開いた VS Code の画面で、`html/index.php` (dvc-php コンテナー内での絶対パスは `/home/node/workspace/php/html/index.php`)を開き、ブレイクポイントを設定したら準備完了です。

「実行とデバッグ」を開いて、次の動作確認します。

- Listen for Xdebug
- Launch currently open script
- Launch Built-in web server

### Listen for Xdebug

「Listen for Xdebug」 は php-apache のコンテナーを起動してデバッグする方法になります。

php-apache のコンテナーは、dvc-php の開発コンテナーと同じ `/home/node/workspace` を同じ Docker ボリュームをマウントすることで共有しているので、デバッグが普通にできます。

dvc-php コンテナー起動時に `/php-apache` へバインドマウントしてあるので、それを起動して使います。

```console
sh /php-apache/script/up.sh
```

`docker compose up` コマンドで起動することもできます。

```console
docker compose -f /php-apache/compose.yaml up -d
```

php-apache コンテナーが起動してから VS Code で「Listen for Xdebug」を実行します。

それから、VS Code をアタッチした dvc-php のターミナルから <http://php-apache:80/> へアクセスすると、VS Code がデバッグ画面になります。

```console
curl http://php-apache:80/
```

noVNC を使ってアクセスすることもできます。Docker ホストの Web ブラウザから <http://127.0.0.1:6080/> へアクセスすると、dvc-php コンテナーの noVNC の画面にアクセスできます。認証情報は `dvc/README.md` にあります。`dvc-novnc/README.md` も参考にしてください。

マウスを右クリックで表示されるメニューから Chromium を選択すると、noVNC の画面内で Chromium が起動します。ここから <http://php-apache/> へアクセスすると、VS Code がデバッグ画面になります。

Docker ホストの Web ブラウザから直接 php-apache コンテナーの apache2 Web サーバーへアクセスしても良いです。Docker ホストの Web ブラウザから <http://127.0.0.1:8080/> へアクセスすると、VS Code がデバッグ画面になります。

デバッグの動作確認ができたら、デバッグを終了（□のボタンをクリック）します。このままだと Apache HTTP Server は起動したままなので、そちらも終了する場合は php-apache コンテナーを削除します。

```console
sh /php-apache/script/down.sh
```

`docker compose down` コマンドを使っても良いです。

```console
docker compose -p php-apache down
```

### Launch currently open script

VS Code の画面で、`html/index.php` を開いた状態で、「Launch currently open script」を実行すると、このファイルを直接実行します。こちらは、ファイル単位で実行したい PHP ファイルがあるときに使います。

### Launch Built-in web server

VS Code の画面で、「Launch Built-in web server」を実行すると、PHP のビルトイン Web サーバーをデバッグモードで起動できます。

これを実行して、PHP のビルトイン Web サーバーが起動したら、VS Code をアタッチした dvc-php のターミナルから <http://php-apache:80/> へアクセスします。もしくは、Docker ホストの Web ブラウザから <http://127.0.0.1:8080/> へアクセスします。

すると、VS Code がデバッグ画面になります。

```console
curl http://php-apache:80/
```

デバッグの動作確認ができたら、デバッグを終了（□のボタンをクリック）します。すると、PHP のビルトイン Web サーバーが終了します。ビルトイン Web サーバーは単純な PHP プログラムを実行する場合は良いのですが、PHP のフレームワークを使うような場合は力不足となることがあります。開発の初期に、phpinfo の情報を確認するなど、Web サーバーが必要な PHP プログラムの動作確認時に使うと良いでしょう。
