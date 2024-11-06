# dvc-novnc

desktop-lite:1.2.5 では環境変数 VNC_PASSWORD へ `enable` などの文字列を指定しないと、VNC の認証が無効化されています。これを回避するためにカスタマイズをしています。

ちなみに VNC 認証用のパスワードは `dvc/README.md` に書いてあるとおり、dvc が提供するイメージでは `vscode` としてあります。

なお、VNC パスワード認証を無効化するには `dvc-novnc/compose.yaml` にある `VNC_PASSWORD` の行を有効化します。

また、VNC パスワード認証で使用するパスワードを変更するには `compose.yaml` で `VNC_PASSWORD` の行を有効化し、`.env` へ `VNC_PASSWORD` の指定を追加します。

他の dvc で VNC が使えるイメージについても、同様にして VNC パスワード認証を調整することができます。
