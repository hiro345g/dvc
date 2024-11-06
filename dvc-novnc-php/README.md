# dvc-novnc-php

この開発コンテナーを使って PHP アプリをデバッグできることをサンプルを用意して確認してあります。
どのようにデバッグできるかについては `sample/README.md` に説明がありますので、そちらをご覧ください。

## mise の利用

mise を使うことで、PHP の他のバージョンをインストールして利用することができます。

PHP 8.3 でインストール可能なバージョンの一覧表示。

```console
mise ls-remote php@8.3
```

PHP 8.3.13 のインストール。

```console
mise install php@8.3.13
```

グローバルで利用するものを指定（現在、dvc-novnc-php/.devcontainer/script/init.sh で、このコマンド実行したときに作成されるファイルを自動作成しています。グローバルで使うものを system 以外にしたい場合は、そちらを調整する必要があります）。

```console
mise -y use --global php@system
```

mise でインストールした PHP のリスト。

```console
mise ls php
```

実際に実行したときの結果。

```console
node ➜ ~/workspace/php $ mise -y use --global php@system
mise ~/.config/mise/config.toml tools: php@system
node ➜ ~/workspace $ mise ls php
Tool  Version    Config Source              Requested
php   system     ~/.config/mise/config.toml system   
php   8.3.13
node ➜ ~/workspace/php $ php -v
PHP 8.2.25 (cli) (built: Nov  6 2024 12:16:44) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.2.25, Copyright (c) Zend Technologies
    with Xdebug v3.3.2, Copyright (c) 2002-2024, by Derick Rethans
```

php 8.3 を使うプロジェクト。

```console
mkdir ~/workspace/php83 && cd ~/workspace/php83
mise use php@8.3.13
```

これで `php83/.mise.toml` が作成されます。

```toml
[tools]
php = "8.3.13"
```

カレントを php83 ディレクトリーとすると PHP 8.3.13 が有効になります。

`mise exec` コマンドで mise の php を実行できます。

```console
mise exec -- php -v
```

アンインストールは `mise uninstall` を使います。

```console
mise uninstall php@8.3.13
```

### mise 用 Docker ボリューム

dvc-novnc-php 用の `compose.yaml` では mise 用 Docker ボリュームとして `dvc-mise-data` を用意してあります。

これを初期化したい場合は dvc-mise-data を削除します。

```console
docker volume rm dvc-mise-data
```

## php-apache

dvc-novnc-php 開発コンテナーで使える PHP と同じバージョンで Apache と組み合わせて動作するコンテナーを用意してあります。MySQL も使えるようにしてあります。

使い方は `php-apache/README.md` を参照してください。

mise でインストールした PHP を使って開発をする場合は、これを参考にして PHP のバージョンを合わせた php-apache 用のイメージをビルドし、それを使う `compose.yaml` を作成します。
