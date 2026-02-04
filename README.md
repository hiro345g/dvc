# hiro345g/dvc

Dev Container based on mcr.microsoft.com/devcontainers/typescript-node (desktop-lite, docker-outside-of-docker, git, git-lfs)

ここでは、次のプログラミング言語に対応する開発コンテナー（Dev Container）用のイメージをビルドする方法を提供しています。

| イメージ名:タグ   | os        | node | vnc   | mise | go   | jdk | php | python | ruby |
| ----------------- | --------- | ---- | ----- | ---- | ---- | --- | --- | ------ | ---- |
| dvc:base-202602   | debian 13 | 24   | -     | -    | -    | -   | -   | -      | -    |
| dvc:novnc-202602  | debian 13 | 24   | 1.2.0 | -    | -    | -   | -   | -      | -    |
| dvc:202602        | debian 13 | 24   | 1.2.0 | i    | -    | -   | -   | -      | -    |
| dvc:go-202602     | debian 13 | 24   | 1.2.0 | i    | 1.25 | -   | -   | -      | -    |
| dvc:jdk-202602    | debian 13 | 24   | 1.2.0 | i    | -    | 21  | -   | -      | -    |
| dvc:php-202602    | debian 13 | 24   | 1.2.0 | i    | -    | -   | 8.2 | -      | -    |
| dvc:python-202602 | debian 13 | 24   | 1.2.0 | i    | -    | -   | -   | 3.14   | -    |
| dvc:ruby-202602   | debian 13 | 24   | 1.2.0 | i    | -    | -   | -   | -      | 3.4  |
| dvc:gnr-202602    | debian 13 | 24   | 1.2.0 | i    | 1.25 | -   | -   | -      | 3.4  |
| dvc:gnpr-202602   | debian 13 | 24   | 1.2.0 | i    | 1.25 | -   | -   | 3.12   | 3.4  |

表について補足説明

- debian 13 のコードネームは trixie
- vnc は tigervnc
- mise は jdx/mise の略、i でインストール済みでバージョンは 2026.2.2
- jdk は 17, 25 もインストール済み

## 説明

これは、`node` コマンドが使える簡易デスクトップ環境を提供する開発コンテナー（Dev Container）を簡単に使えるようにしたものです。次の特長があります。

- VS Code で使える開発コンテナー（Dev Container）
- Node.js 環境での TypeScript プログラミングが可能
- 開発専用の Web ブラウザ
- 日本語入力に対応
- プログラミング言語 Python、Java 用の Dev Container に対応

dvc を使うと日本語に対応した簡易 Desktop 環境が動く Docker コンテナーが使えるようになります。簡易 Desktop 環境には VNC という仕組みを使って接続して利用できます。利用方法としては Web ブラウザを使う方法、VNC クライアントを使う方法があります。

| クライアント     | URL                     |
| ---------------- | ----------------------- |
| Web ブラウザ     | <http://localhost:6080> |
| VNC クライアント | <vnc://localhost:5901>  |

VNC 接続をすると、簡易 Desktop 環境で Firefox や Chromium が用意できるようになり、Web アプリの開発などでも利用できるようになります。

## dvc で解決できること

Web アプリ開発時に、普段の Web ブラウザを使っていて、次のような場面で困ったことがありませんか？

- 開発で使っているキャッシュだけクリアしたい
- 開発で使っている Cookie だけクリアしたい
- 開発用のプラグインは開発中だけ有効にしたい

開発中に利用する Web ブラウザは普段の利用方法とは違った使い方になります。そのため、開発専用の Web ブラウザ環境を用意したいときがあります。Web ブラウザのプロファイル機能を使うと、ある程度は解決するのですが、Docker コンテナーとして用意できるなら、それを使うのも「あり」だろうと考えて、dvc 環境を用意しました。

これを使うと、普段使っているデスクトップ環境から隔離されたコンテナー環境で Firefox や Chromium といった Web ブラウザを使うことができるようになります。隔離された環境なので、例えばホストファイルにステージング環境の IP と実際に使うホスト名のエントリを登録して動作させることもできます。開発中の Web アプリの動作を確認するための専用 Web ブラウザ環境なので、後で正しい IP へ戻すといった作業も発生しません。こういった環境を用意することで、効率よく Web アプリの開発ができるようになります。

VS Code の Dev Container 拡張機能を基盤としたものなので、Docker ホストマシンから隔離されたコンテナ内で Web アプリの開発を閉じることができます。複数の Web アプリ開発をしている場合、Docker ホストマシンの環境を利用していると、開発する対象の Web アプリを切り替えるときの負担が大きくなります。開発する対象の Web アプリの単位でコンテナ環境を用意すれば、コンテナ内で環境を完結させることができるので、開発する対象の Web アプリを切り替える際の負担が軽減されます。

## 使用しているもの

Docker イメージは Docker Hub の <https://hub.docker.com/r/hiro345g/dvc> で公開されているものを使用します。ちなみに、この GitHub のリポジトリーには、この Docker イメージをビルドするためのファイルも含まれているので、Docker Hub のものを使わずにローカルマシンでビルドしたものを使うこともできます。

なお、このリポジトリで公開している、ローカルマシンでビルドする場合に使うコード（Dockerfile や devcontainer.json）のライセンスは MIT ライセンスとなっています。しかし、ローカルマシンでビルドしたイメージや <https://hub.docker.com/r/hiro345g/dvc> で公開されているイメージを使う場合は、MIT ライセンスではなく、イメージに含まれるソフトウェアのライセンスに同意した上で使う必要があります。そのため、イメージに含まれるソフトウェアについて、ここで説明します。

### mcr.microsoft.com/devcontainers/typescript-node:24-trixie イメージ

dvc では、<https://github.com/devcontainers/images/tree/main/src/typescript-node> で公開されている mcr.microsoft.com/devcontainers/typescript-node:24-trixie の Docker イメージをベースとしています。これは [Debian](https://www.debian.org/) をベースとしているので、基本的なライセンスは <https://www.debian.org/social_contract#guidelines> に従います。

### <https://github.com/devcontainers/features/> フィーチャー

ベースに追加でフィーチャー（Feature）を適用しています。具体的には <https://github.com/devcontainers/features/> で公開されている common-utils、desktop-lite、docker-outside-of-docker、git、git-lfs を指定して Docker イメージを作成しています。

- [common-utils](https://github.com/devcontainers/features/tree/main/src/common-utils)
- [desktop-lite](https://github.com/devcontainers/features/tree/main/src/desktop-lite)
- [docker-outside-of-docker](https://github.com/devcontainers/features/tree/main/src/docker-outside-of-docker)
- [git](https://github.com/devcontainers/features/tree/main/src/git)
- [git-lfs](https://github.com/devcontainers/features/tree/main/src/git-lfs)

これらのフィーチャーは、基本的にはベースとするイメージである Debian のパッケージを使ってソフトウェアをインストールしているので、そのパッケージのライセンスに従います。Debian のパッケージに含まれるソフトウェアであっても Debian のライセンスとは限らない点に注意してください。例えば、`docker-outside-of-docker` に含まれる Docker 関連のソフトウェアは [moby/LICENSE](https://github.com/moby/moby/blob/master/LICENSE) のライセンスに従います。

### Web ブラウザ

dvc では、desktop-lite に次の Web ブラウザを追加して使えるようにしてあります。locale 周りの設定もしてあり、追加で fonts-vlgothic フォントもインストールしてあります。

| ソフトウェア                                                  | ライセンスに関する情報                                                                |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| [Firefox](https://www.mozilla.org/firefox/) ESR               | [Mozilla Public Licence](https://www.mozilla.org/en-US/MPL/)                          |
| [Chromium](https://www.chromium.org/Home/)                    | [chromium/src/LICENSE](https://chromium.googlesource.com/chromium/src/+/HEAD/LICENSE) |
| [VL ゴシックフォント](https://ja.osdn.net/projects/vlgothic/) | [daisukesuzuki/VLGothic](https://github.com/daisukesuzuki/VLGothic)                   |

### プログラミング言語用フィーチャー

dvc では、Go、Java、PHP、Python、Ruby のフィーチャーを追加で指定した Dev Container も用意してあります。

- [go](https://github.com/devcontainers/features/tree/main/src/go)
- [java](https://github.com/devcontainers/features/tree/main/src/java)
- [php](https://github.com/devcontainers/features/tree/main/src/php)
- [python](https://github.com/devcontainers/features/tree/main/src/python)
- [ruby](https://github.com/devcontainers/features/tree/main/src/ruby)

go フィーチャーでインストールされる Go については、<https://github.com/golang/go/blob/master/LICENSE> にあるライセンス情報に従います。

java フィーチャーについては、<https://github.com/devcontainers/features/blob/main/src/java/NOTICE.txt> にあるライセンス情報に従います。なお、java フィーチャーでは内部的に [SDKMAN\!](https://github.com/sdkman) というソフトウェアを使っています。このソフトウェアのライセンスは [sdkman\-cli/LICENSE](https://github.com/sdkman/sdkman-cli/blob/master/LICENSE) で確認することができます。

php フィーチャーについては、ベースとするイメージのライセンスに従うと考えて良いです。正確には [PHP Licensing](https://www.php.net/license/index.php) を確認してください。

python フィーチャーについては、ベースとするイメージのライセンスに従うと考えて良いです。正確には [Python 3 documentation: History and License](https://docs.python.org/3/license.html) を確認してください。

Ruby フィーチャーでインストールされる Ruby については、<https://www.ruby-lang.org/en/about/license.txt> にあるライセンス情報に従います。

なお、dvc では、次のフィーチャーを組み合わせた Dev Container も用意してあります。

| タグ            | ベース          | フィーチャー     |
| --------------- | --------------- | ---------------- |
| gnr-バージョン  | typescript-node | go, ruby         |
| gnpr-バージョン | typescript-node | go, python, ruby |

### jdx/mise

開発コンテナーで使いたいプログラミング言語用のツールについて、バージョンを変更したい場合もあります。それに対応するために、[mise](https://github.com/jdx/mise) をインストールしたイメージも用意してあります。

mise のライセンスは <https://github.com/jdx/mise?tab=MIT-1-ov-file#readme> にあります。

### desktop-lite によるデスクトップ環境について

desktop-lite によるデスクトップ環境では、次のソフトウェアが使えるようになっています。

- [FluxBox](http://fluxbox.org/download/)
- [TigerVNC](https://tigervnc.org/)
- [noVNC](https://novnc.com/)

### 白源フォントについて

Nerd フォントによる表示に対応するため、白源フォントを含めてあります。

- [プログラミングフォント 白源 (はくげん／HackGen)](https://github.com/yuru7/HackGen)

ライセンスは下記に説明があります。

- [HackGen License](https://github.com/yuru7/HackGen?tab=License-1-ov-file#readme)

### Dev Container について

Dev Container については、開発が <https://github.com/devcontainers> でされていますので、そちらをご覧ください。

ここで用意している `compose.yaml` では、開発するアプリの Git リモートリポジトリを dvc コンテナーの `/home/node/workspace` （つまり、`dvc:/home/node/workspace`）へクローンして開発することを想定しています。

また、`dvc:/home/node/workspace` は Docker ボリュームの dvc-workspace-data をマウントして使うようになっています。他にも dvc-vscode-server-extensions という Docker ボリュームを使うようになっています。

## 必要なもの

dvc を動作をさせるには、Docker、Docker Compose、Visual Studio Code (VS Code) 、Docker 拡張機能、Dev Containers 拡張機能が必要です。

### Docker

- [Docker Engine](https://docs.docker.com/engine/)
- [Docker Compose](https://docs.docker.com/compose/)

これらは [Docker Desktop](https://docs.docker.com/desktop/) をインストールしてあれば使えます。WSL が使える環境、もしくは Linux 環境であれば、Docker Desktop をインストールしなくても Docker Engine と Docker Compose だけをインストールして使えます。例えば、Ubuntu を使っているなら [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/) を参照してインストールしておいてください。

### Visual Studio Code

- [Visual Studio Code](https://code.visualstudio.com/)
- [Container Tools 拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-containers)
- [Docker DX (Developer Experience) 拡張機能](https://marketplace.visualstudio.com/items?itemName=docker.docker)
- [Dev Containers 拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

VS Code の拡張機能である Container Tools、Docker DX、Dev Containers を VS Code へインストールしておく必要があります。

### 動作確認済みの環境

次の環境で動作確認をしてあります。Windows や macOS でも動作するはずです。

```console
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 24.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.3 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=noble
LOGO=ubuntu-logo

$ docker version
Client: Docker Engine - Community
 Version:           29.1.3
 API version:       1.52
 Go version:        go1.25.5
 Git commit:        f52814d
 Built:             Fri Dec 12 14:49:32 2025
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          29.1.3
  API version:      1.52 (minimum version 1.44)
  Go version:       go1.25.5
  Git commit:       fbf3ed2
  Built:            Fri Dec 12 14:49:32 2025
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          v2.2.1
  GitCommit:        dea7da592f5d1d2b7755e3a161be07f43fad8f75
 runc:
  Version:          1.3.4
  GitCommit:        v1.3.4-0-gd6d73eb8
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0

$ docker compose version
Docker Compose version v2.40.3-desktop.1
```

## ファイルの構成

ファイルの構成は次のようになっています。

```text
dvc/
├── .gitignore
├── LICENSE ... ライセンス
├── README.md ... このファイル
├── build-image/script ... イメージをビルドするスクリプト
├── dvc/ ... dvc 開発コンテナー用
├── dvc-base/ ... dvc:base 開発コンテナー用
│   ├── .devcontainer/
│   │   └── devcontainer.json ... 開発コンテナー用設定ファイル
│   ├── build/ ... 開発コンテナービルド用
│   │   ├── Dockerfile
│   │   ├── build.sh
│   │   ├── devcontainer.json
│   │   ├── node.dot.bashrc
│   │   └── node.dot.npmrc
│   ├── compose.yaml ... dvc イメージ起動用 compose.yaml
│   └── sample.env ... .env ファイルのサンプル
├── dvc-gnpr/ ... dvc:gnpr 開発コンテナー用
├── dvc-gnr/ ... dvc:gnr 開発コンテナー用
├── dvc-go/ ... dvc:go 開発コンテナー用
├── dvc-jdk/ ... dvc:jdk 開発コンテナー用
├── dvc-novnc/ ... dvc:novnc 開発コンテナー用
├── dvc-novnc-mise/ ... dvc:novnc-mise 開発コンテナー用
├── dvc-php/ ... dvc:php 開発コンテナー用
├── dvc-python/ ... dvc:python 開発コンテナー用
├── dvc-ruby/ ... dvc:ruby 開発コンテナー用
└── workspace_share/ ... Docker ホストとコンテナーとでファイルを共有するためのディレクトリー
    ├── .gitkeep
    ├── dev/
    │   └── .gitkeep
    ├── fonts-noto-cjk-conf/
    │   └── local.conf
    └── script/
        ├── create-dvc-novnc-mozc.sh
        └── install_mozc.sh ... mozc インストール用スクリプト
```

この後、リポジトリをクローンもしくはアーカイブファイルを展開した `dvc` ディレクトリーのパスを `${REPO_DIR}` と表現します。

## デスクトップ環境

VNC (Virtual Network Computing) を使ってデスクトップ環境へアクセスします。パスワードは次のとおりです。

- VNC のパスワード: vscode

別のパスワードにしたい場合は、コンテナ用の環境変数 `VNC_PASSWORD` を用意し、そこへパスワード文字列を指定すること。なお、認証を無効化するには、`VNC_PASSWORD` の値へ `noPassword` という文字列を指定すること。

ちなみに、VNC のパスワードは最大長8文字なので、それ以上の値を指定しても先頭の8文字が一致すると認証されてしまう点に注意すること。

## 使い方

ここでは使い方について説明します。各イメージについて、サンプルが用意してあるので、それを参考にしてください。たとえば、`hiro345g/dvc:gnpr-202602` のイメージを使いたい場合は `dvc-gnpr` を参照します。

例として、`hiro345g/dvc:gnpr-202602` のイメージを使う方法について説明します。

### 使う準備

まず、`dvc-gnpr` をコピーします。ここではユーザーが書き込みできる `/workspace` がすでに用意されているとして、そこへコピーするとします。

```bash
cp -r dvc-gnpr /workspace/
```

ターミナルを開いてカレントを `/workspace/dvc-gnpr` とします。

```bash
cd /workspace/dvc-gnpr
```

それから、このあとに説明する「環境変数」を参照して、`/workspace/dvc-gnpr/.env` ファイルを用意してください。`.env` ファイル内で `SHARE_DIR` に存在するパスを指定する必要があります。

カスタマイズをしたい場合は、「カスタマイズ」を参照して Docker イメージを作成してください。

### 環境変数

`.env` ファイルを用意すると `compose.yaml` 内の `${変数名}` で指定されているものを、`.env` で指定したものへ変更できます。具体的な指定方法は `sample.env` ファイルを参考にしてください。

`dvc-gnpr/compose.yaml` では、開発コンテナーと Docker ホストとでファイルを手軽に参照したり転送したりできるように、`dvc-gnpr:/share` をバインドマウントするようにしていて、Docker ホスト側で使用するディレクトリーを `SHARE_DIR` で指定します。Docker ホスト側に存在するものを指定してください。

`hiro345g/dvc:gnpr-202602` のイメージを使う `dvc-gnpr/compose.yaml` のサンプルについては、コピーをしないで利用する想定で、あらかじめ `dvc-gnpr` と同じ階層にある `workspace_share` ディレクトリーを使う設定となっています。`/workspace/dvc-gnpr` へコピーすると、そのままではバインドマウントが失敗する状態となります。

これについて、`compose.yaml` ファイルを変更しなくても対応できるように、環境変数 `SHARE_DIR` を用意してあります。次の例では `/workspace/share` ディレクトリーを作成して、それを使うようにしています。

```sh
cd /workspace
mkdir share
echo 'SHARE_DIR=/workspace/share' > /workspace/dvc-gnpr/.env
```

### 利用方法

VS Code を起動し、F1 キーを入力してコマンドパレットを表示してから、「開発コンテナー: コンテナーでフォルダを開く...（Dev Containers: Open Folder in Container...）」をクリックします。フォルダーを選択する画面になるので `/workspace/dvc-gnpr` を指定して開きます。

すると `/workspace/dvc-gnpr/.devcontainer/devcontainer.json` の指定にしたがって、dvc:gnpr-202602 イメージのコンテナーが開発コンテナー（Dev Container）として起動します。このとき、拡張機能なども追加されます。それから、この開発コンテナー用の VS Code の画面となります。

サンプルでは、開発コンテナーから Docker ホストのファイルを間違えて操作しないように、`/workspace/dvc-gnpr` は見えないようにしてあります。この方法で開発コンテナーを起動すると、VNC が使えるようになります。なお、`/workspace/dvc-gnpr/compose.yaml` を `docker compose` コマンドなどで通常のコンテナーとして起動した場合は、そのままでは VNC サーバーが起動しません。

開発コンテナーが起動したら、Web ブラウザから <http://localhost:6080> へアクセスします。すると、VNC 接続の画面になるので、「接続」をクリックしてパスワードを入力します。

VNC クライアントを使う場合は localhost:5901 へアクセスします。パスワードは  <http://localhost:6080> へアクセスする場合と同じです。接続したら、マウスクリックで表示できるメニューから Firefox や Chromium を起動して使うことができます。

これで dvc:gnpr-202602 イメージの開発コンテナーで Node.js を使った Web アプリの開発をしつつ、Web ブラウザで動作確認ができます。Docker ホストの環境から隔離されているため、開発している Web アプリの動作確認のための Web ブラウザ用設定がしやすくなります。

### 開発コンテナーの停止、削除の仕方

VS Code の Docker 拡張機能の画面で、CONTAINERS の欄に表示されている dvc-gnpr-202602 のコンテキストメニューから `Compose Stop` でコンテナー停止、`Compose Down` でコンテナー削除ができます。

## 日本語入力

日本語入力については、現在は正式にはサポートしていません。必要な場合は [GitHub \- linuxserver/docker\-webtop: Ubuntu, Alpine, Arch, and Fedora based Webtop images, Linux in a web browser supporting popular desktop environments\.](https://github.com/linuxserver/docker-webtop) のコンテナを利用することを推奨します。

参考までに、dvc のイメージをベースとする開発コンテナーで日本語入力ができるようにする方法について基本的な事項の説明をします。現在は動作確認していないため、そのままでは動作しないかもしれません。

Docker イメージ作成直後は日本語入力ができる状態になっていません。インストール時に GUI が必要だからです。コンテナー起動後に、ibus-mozc をインストールすると日本語入力ができるようになります。インストール用スクリプトをコンテナー内の `/share/script/install_mozc.sh` で参照できるようにしてあるので、日本語入力が必要な場合は、VNC 接続してターミナルを起動し、次のように実行します。

```console
sh /share/script/install_mozc.sh
```

「dbus-launch --autolaunch=（略）」のエラーが発生しますが無視して大丈夫です。

次に画面右下隅の `EN` のアイコン（IBus のアイコン）を右クリックして表示されるメニューで「Restart」します。それから、同じメニューにある「Preference」をクリックします。

表示された「IBuss Preference」画面の「Input Method」タブを表示し、「Add」をクリックします。一覧で「Japanese」をクリックし、表示された選択肢の中から「Mozc」を選択肢て「Add」をクリックします。これで日本語入力ができる環境の準備は終わりで、IBus のアイコンから Mozc の入力を切り替えることができるようになります。

なお、 mozc の設定をする場合は下記のコマンドを実行します。

```console
/usr/lib/mozc/mozc_tool --mode=config_dialog
```

入力の切り替えについては、画面右下隅の IME のアイコンをクリックして表示されるメニューを使います。

### noVNC での日本語入力

noVNC では「半角/全角」キーの入力が効かないので、英語と日本語の入力を切り替えするときに戸惑うでしょう。

ショートカットキーで IME の切り替えができるので、それを使います。初期値は「`Super`space」となっていて、「Windowsキーとスペースキーの同時入力」で切り替えができます。日本語入力をしたい場合は Mozc、英語入力をしたい場合は、English の IME を使います。Mozc は「ひらがな」の入力設定にしておきます。

ショートカットキーの変更は、「IBuss Preference」画面の「General」タブの「Keyboard Shortcuts」にある「Next input method:」で英語と日本語のIME 利用切り替えのショートカットを指定できます。ここを「`<Shift>space`」などに変更することもできます。

IBus の設定を保存しておく場合は、下記のコマンドを使います。

```console
dconf dump /desktop/ibus/ > /share/ibus.dconf
```

保存した設定を反映するには、下記のようにします。

```console
dconf load /desktop/ibus/ < /share/ibus.dconf
```

ショートカットーキーを「`Super`space」以外にするなら、IBus の設定ではなく、Mozc の設定の方でもできます。IBus のアイコンをクリックすると表示されるメニューで「Japanese - Mozc」を選択した状態にしていると、「ツール」-「プロパティ」というメニューが表示されるので、これをクリックすると Mozc Settings の画面が表示されます。この画面の「General」タブにある「Keymap」の「Customize...」をクリックすると「Mozc keymap editor」の画面が表示されて、ショートカットキーの調整ができます。ここで、IME の切り替え用ショートカットを調整することを検討してみると良いでしょう。

たとえば、「Shift + Space」キーの入力で切り替えするのであれば、次のようにします。「Mozc keymap editor」の画面で、「Edit」-「New entry」で下記のキーを追加します。

- Mode: DirectInput
- Key: Shift Space
- Command: Activate IME

また、既存の下記のキーマップについて、Command の値を `Insert alternate space` から `Deactivate IME` に変更します。

- Mode: Precomposition
- Key: Shift Space
- Command: Insert alternate space

変更後は次のようになります。

- Mode: Precomposition
- Key: Shift Space
- Command: Deactivate IME

IBus アイコンの右クリックメニューで「Restart」をクリックして再起動します。これで「Shift + Space」キーの入力で、入力モードの「直接入力」と「ひらがな」を切り替えできるようになります。ただし、これらのショートカットの設定前に起動していたアプリケーションでは有効にならないので、その場合はアプリケーションも再起動してください。

### フォント

フォントは fonts-vlgothic パッケージを使っています。Noto にしたい場合は、`dvc-gnpr:/share/fonts-noto-cjk-conf/local.conf` を `dvc-gnpr:/etc/fonts/local.conf` へコピーします。具体的には開発コンテナーのターミナルで次を実行します。

```console
sudo cp /share/fonts-noto-cjk-conf/local.conf /etc/fonts/local.conf
```

ファイルの作成後、fonts-noto-cjk をインストールします。fc-cache でキャッシュクリア、fc-match でデフォルトフォントの確認をします。

```console
$ sudo apt -y install fonts-noto-cjk fonts-noto-cjk-extra
(略)
$ fc-cache -v
(略)
$ fc-match
NotoSansCJK-Regular.ttc: "Noto Sans CJK JP" "Regular"
```

IBus のアイコンで Restart をすると IBus のメニューへも反映されます。

### dvc:gnpr-202602-mozc

この Docker イメージを使い続ける場合は、タグをつけておくなどして、再利用できるようにしておくと良いでしょう。

イメージにタグをつけます。タグをつける場合は、次のようにします。

```console
docker compose -p dvc-gnpr stop dvc-gnpr
docker container commit dvc-gnpr dvc:gnpr-202602-mozc
```

dvc-gnpr コンテナーは削除します。

```console
docker compose -p dvc-gnpr down
```

作成したイメージを使うように `/workspace/dvc-gnpr/compose.yaml` を変更します。

```bash
sed -i 's%hiro345g/dvc:gnpr-202602%dvc:gnpr-202602-mozc%' /workspace/dvc-gnpr/compose.yaml
```

以上で `/workspace/dvc-gnpr` から開発コンテナーを起動すると、mozc がインストールされた状態の `dvc:gnpr-202602-mozc` のイメージが使われるようになります。

### npm 用環境変数の設定

npm 用環境変数の設定は devcon-gnpr コンテナーの `/home/node/workspace/.npmrc` に指定するようにしてあります。これは `compose.yaml` の環境変数 `NPM_CONFIG_USERCONFIG` を使っています。`.env` ファイル内の `NPM_CONFIG_USERCONFIG` の指定を変更することで、この環境変数の値を変更して、自分で用意した `.npmrc` ファイルを使えるようになります。npm 用環境変数の設定を変更したい場合は、この機能を使ってください。

なお、初期設定では、開発コンテナーのユーザー node が npm パッケージをグローバルにインストールできるようにするため、`.npmrc` ファイルには、次のような指定をしてあります。

```text
prefix=/home/node/workspace/.npm-global
```

このため、グローバルにインストールした npm パッケージは `/home/node/workspace/.npm-global` の下にインストールされます。

ちなみに、`.npmrc` で指定した `prefix` の値を変更したいだけの場合は、`compose.yaml` の `environment:` へ環境変数 `NPM_CONFIG_PREFIX` を追加して指定することもできます。その場合は環境変数 `NPM_CONFIG_USERCONFIG` の方は無効化しておくと無難です。

## カスタマイズ（ビルド）

デフォルトでは、Docker Hub で公開してあるビルド済みのものを使っていますが、このイメージをカスタマイズしたものを使うこともできます。`/workspace/dvc-gnpr/build` にあるものを使います。

カスタマイズしたイメージを使用するにはビルドが必要です。このリポジトリで用意してある開発コンテナー用イメージについては、Dev Container 環境を起動する度に自動でビルドを実行する必要はないので、ビルド作業を別にしてあります。実行時用のものと似たような `compose.yaml` を用意することになりますが、こうしておいた方が Docker イメージのタグ名指定が設定ファイルで明示的にわかるようになります。また、意図しない更新も入りにくくなり、利用時に安定します。

自分でビルドをする場合は次の2つの方法があります。

- VS Code を使う方法
- build.sh を使う方法

カスタマイズは `/workspace/dvc-gnpr/build` にある `.devcontainer/devcontainer.json` や `Dockerfile` を修正してください。必要なら、他のファイルもカスタマイズしてください。

この後、次の順に説明します。

- ビルドの準備
- VS Code を使ったビルド方法
- build.sh を使ったビルド方法
- VNC Server のパスワード、ポート番号の変更
- `hiro345g/dvc:gnpr-202602` へ戻す方法
- カスタムイメージの削除方法

### ビルドの準備

最初にビルド済みの `hiro345g/dvc:gnpr-202602` イメージを `docker image pull` しておきます。次のようにコマンドを実行します。

```console
docker image pull hiro345g/dvc:gnpr-202602
```

基本は、これをカスタマイズすることになります。

次に `/workspace/dvc-gnpr/build/` にある `.devcontainer/devcontainer.json` や `Dockerfile` を修正してください。必要なら、他のファイルもカスタマイズしてください。

この後、`dvc:gnpr-202602` のカスタムイメージを作成する方法を説明します。

### VS Code を使ったビルド方法

VS Code を起動してから、F1 キーを入力して VS Code のコマンドパレットを表示します。入力欄へ「dev containers open」などと入力すると「開発コンテナー: コンテナーでフォルダを開く...（Dev Containers: Open Folder in Container...）」が選択肢に表示されます。これをクリックすると、フォルダーを選択する画面になるので `/workspace/dvc-gnpr/build` を指定して開きます。

`vsc-build-` で始まる Docker イメージが作成されてコンテナーが起動します。`vsc-build-` で始まる Docker イメージに `dvc:gnpr-202602` のタグをつけます。

例えば、次の例だと vsc-build-b3ed032a709b975173b2f2fcf5212c79-uid といったイメージが作成されたので、それに対して `dvc:gnpr-202602` のタグをつけています。

```console
$ docker container ls |grep vsc
351cab45fe6c   vsc-build-b3ed032a709b975173b2f2fcf5212c79-uid   （略）
$ docker tag vsc-build-b3ed032a709b975173b2f2fcf5212c79-uid dvc:gnpr-202602
```

使用する Docker イメージを作成した `dvc:gnpr-202602` へ変更する必要があるので、`/workspace/dvc-gnpr/compose.yaml` を次のように編集します。

```yaml
name: dvc-gnpr
services:
  dvc-gnpr:
    #image: hiro345g/dvc:gnpr-202602
    image: dvc:gnpr-202602
    container_name: dvc-gnpr
    （略）
```

### build.sh を使ったビルド方法

`/workspace/dvc-gnpr/build/build.sh` スクリプトを実行すると、カスタム Docker イメージをビルドしてタグ `dvc:gnpr-202602` をつけることができます。

`build.sh` スクリプトを利用するには、`npm` コマンド、`docker` コマンドが実行できる環境が必要です。内部的に `@devcontainers/cli` を `npm exec` コマンドで実行しています。

```console
sh /workspace/dvc-gnpr/build/build.sh
```

ビルドが成功したら、使用する Docker イメージを作成した `dvc:gnpr-202602` へ変更する必要があるので、`/workspace/dvc-gnpr/compose.yaml` を次のように編集します。

```yaml
name: dvc-gnpr
services:
  dvc-gnpr:
    #image: hiro345g/dvc:gnpr-202602
    image: dvc:gnpr-202602
    container_name: dvc-gnpr
    （略）
```

### VNC Server のパスワード、ポート番号の変更

パスワード、Web版VNC Client用ポート番号、VNC Viewer用ポート番号を変更したい場合は、`build/.devcontainer/devcontainer.json` 内のファイルを編集して、`"ghcr.io/devcontainers/features/desktop-lite:1":` のオプションで指定できます。

```console
"features": {
    "ghcr.io/devcontainers/features/desktop-lite:1": {
        "password":"vscode",
        "webPort":"6080",
        "vncPort":"5901",
    }
}
```

### `hiro345g/dvc:gnpr-202602` へ戻す方法

`hiro345g/dvc:gnpr-202602` へ戻すには、`/workspace/dvc-gnpr/compose.yaml` を次のように編集します。

```yaml
name: dvc-gnpr
services:
  dvc:gnpr-202602:
    image: hiro345g/dvc:gnpr-202602
    #image: dvc:gnpr-202602
    container_name: dvc-gnpr
    （略）
```

### カスタムイメージの削除方法

カスタムイメージの削除方法について説明します。

一度のビルドで、想定していた使い方ができるカスタムイメージができるのが理想です。ところが、作成したカスタムイメージを動かしてみると、想定していなかった不具合が出てくるなど、うまくいかないことの方が多いものです。そういったときは、カスタムイメージの作り直しをすることになり、その際に作成済みのカスタムイメージを削除したいことがあります。

カスタムイメージを削除したい場合は、`docker image rm` コマンドで削除します。

```console
docker image rm dvc:gnpr-202602
```
