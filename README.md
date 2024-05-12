# hiro345g/dvc

  Dev Container based on mcr.microsoft.com/devcontainers/typescript-node (desktop-lite, docker-outside-of-docker, git, git-lfs)

　これは、`node` コマンドが使える簡易デスクトップ環境を提供する開発コンテナー（Dev Container）を簡単に使えるようにしたものです。次の特長があります。

- VS Code で使える開発コンテナー（Dev Container）
- Node.js 環境での TypeScript プログラミングが可能
- 開発専用の Web ブラウザ
- 日本語入力に対応
- プログラミング言語 Python、Java 用の Dev Container に対応

　dvc を使うと日本語に対応した簡易 Desktop 環境が動く Docker コンテナーが使えるようになります。簡易 Desktop 環境には VNC という仕組みを使って接続して利用できます。利用方法としては Web ブラウザを使う方法、VNC クライアントを使う方法があります。

| クライアント     | URL                     |
|------------------|-------------------------|
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

　dvc では、<https://github.com/devcontainers/images/tree/main/src/typescript-node> で公開されている mcr.microsoft.com/devcontainers/typescript-node:18-bookworm の Docker イメージをベースとしています。これは [Debian](https://www.debian.org/) をベースとしているので、基本的なライセンスは <https://www.debian.org/social_contract#guidelines> に従います。

　ベースに追加で Feature を適用しています。具体的には <https://github.com/devcontainers/features/> で公開されている common-utils、desktop-lite、docker-outside-of-docker、git、git-lfs を指定して Docker イメージを作成しています。

- [common-utils](https://github.com/devcontainers/features/tree/main/src/common-utils)
- [desktop-lite](https://github.com/devcontainers/features/tree/main/src/desktop-lite)
- [docker-outside-of-docker](https://github.com/devcontainers/features/tree/main/src/docker-outside-of-docker)
- [git](https://github.com/devcontainers/features/tree/main/src/git)
- [git-lfs](https://github.com/devcontainers/features/tree/main/src/git-lfs)

　これらのフィーチャーは、基本的にはベースとするイメージである Debian のパッケージを使ってソフトウェアをインストールしているので、そのパッケージのライセンスに従います。Debian のパッケージに含まれるソフトウェアであっても Debian のライセンスとは限らない点に注意してください。例えば、`docker-outside-of-docker` に含まれる Docker 関連のソフトウェアは [moby/LICENSE](https://github.com/moby/moby/blob/master/LICENSE) のライセンスに従います。

　dvc では、desktop-lite に次の Web ブラウザを追加して使えるようにしてあります。locale 周りの設定もしてあり、追加で fonts-vlgothic フォントもインストールしてあります。

| ソフトウェア                                                 | ライセンスに関する情報                                                                |
|--------------------------------------------------------------|---------------------------------------------------------------------------------------|
| [Firefox](https://www.mozilla.org/firefox/) ESR              | [Mozilla Public Licence](https://www.mozilla.org/en-US/MPL/)                          |
| [Chromium](https://www.chromium.org/Home/)                   | [chromium/src/LICENSE](https://chromium.googlesource.com/chromium/src/+/HEAD/LICENSE) |
| [VLゴシックフォント](https://ja.osdn.net/projects/vlgothic/) | [daisukesuzuki/VLGothic](https://github.com/daisukesuzuki/VLGothic)                   |

　dvc では、Python や Java のフィーチャーを追加で指定した Dev Container も用意してあります。

- [python](https://github.com/devcontainers/features/tree/main/src/python)
- [java](https://github.com/devcontainers/features/tree/main/src/java)

　python フィーチャーについては、ベースとするイメージのライセンスに従うと考えて良いです。正確には [Python 3 documentation: History and License](https://docs.python.org/3/license.html) を確認してください。

　java フィーチャーについては、<https://github.com/devcontainers/features/blob/main/src/java/NOTICE.txt> にあるライセンス情報に従います。なお、java フィーチャーでは内部的に [SDKMAN\!](https://github.com/sdkman) というソフトウェアを使っています。このソフトウェアのライセンスは [sdkman\-cli/LICENSE](https://github.com/sdkman/sdkman-cli/blob/master/LICENSE) で確認することができます。

### desktop-lite によるデスクトップ環境について

desktop-lite によるデスクトップ環境では、次のソフトウェアが使えるようになっています。

- [FluxBox](http://fluxbox.org/download/)
- [TightVNC](https://www.tightvnc.com/)
- [noVNC](https://novnc.com/)

### Dev Container について

　Dev Container については、開発が <https://github.com/devcontainers> でされていますので、そちらをご覧ください。

　ここで用意している `compose.yaml` では、開発するアプリの Git リモートリポジトリを dvc コンテナーの `/home/node/workspace` （つまり、`dvc:/home/node/workspace`）へクローンして開発することを想定しています。

　また、`dvc:/home/node/workspace` は Docker ボリュームの dvc-workspace-data をマウントして使うようになっています。他にも dvc-vscode-server-extensions という Docker ボリュームを使うようになっています。

## 必要なもの

　dvc を動作をさせるには、Docker、Docker Compose、Visual Studio Code (VS Code) 、Docker 拡張機能、Dev Containers 拡張機能が必要です。

### Docker

- [Docker Engine](https://docs.docker.com/engine/)
- [Docker Compose](https://docs.docker.com/compose/)

　これらは [Docker Desktop](https://docs.docker.com/desktop/) をインストールしてあれば使えます。Linux では Docker Desktop をインストールしなくても Docker Engine と Docker Compose だけをインストールして使えます。例えば、Ubuntu を使っているなら [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/) を参照してインストールしておいてください。

### Visual Studio Code

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker 拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [Dev Containers 拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

　VS Code の拡張機能である Docker と Dev Containers を VS Code へインストールしておく必要があります。

### 動作確認済みの環境

　次の環境で動作確認をしてあります。Windows や macOS でも動作するはずです。

```console
$ cat /etc/os-release 
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy

$ docker version
Client: Docker Engine - Community
 Cloud integration: v1.0.35+desktop.5
 Version:           24.0.7
 API version:       1.43
 Go version:        go1.20.10
 Git commit:        afdd53b
 Built:             Thu Oct 26 09:07:41 2023
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          24.0.7
  API version:      1.43 (minimum version 1.12)
  Go version:       go1.20.10
  Git commit:       311b9ff
  Built:            Thu Oct 26 09:07:41 2023
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.26
  GitCommit:        3dd1e886e55dd695541fdcd67420c2888645a495
 runc:
  Version:          1.1.10
  GitCommit:        v1.1.10-0-g18a0cb0
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0

$ docker compose version
Docker Compose version v2.23.3-desktop.2
```

## ファイルの構成

　ファイルの構成は次のようになっています。

```text
dvc/
├── .gitignore
├── LICENSE ... ライセンス
├── README.md ... このファイル
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
├── dvc-novnc/ ... dvc:novnc 開発コンテナー用
├── dvc-novnc-jdk/ ... dvc:novnc-jdk 開発コンテナー用
├── dvc-novnc-python/ ... dvc:novnc-python 開発コンテナー用
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

　別のパスワードにしたい場合は、「カスタマイズ」の説明にしたがって、Docker イメージの作成時に指定してください。

## 使い方

基本的に下記で用意しているものと同じです。

- <https://github.com/hiro345g/devcon-gnpr>
- <https://github.com/hiro345g/devcon-gnr>
- <https://github.com/hiro345g/devcon-py-desktop>
- <https://github.com/hiro345g/devcon-desktop>

Docker イメージが使用するディスク容量を最適化するために、これまでプロジェクトを分けていましたが、同じリポジトリで作成する方針にしました。
