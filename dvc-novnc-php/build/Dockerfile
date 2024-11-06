FROM hiro345g/dvc:novnc-mise-202411

# mise は asdf-php プラグインを使用, Debian/Ubuntu で必要なパッケージ一覧は下記で確認可能
# <https://github.com/asdf-community/asdf-php/blob/master/.github/workflows/workflow.yml#L30C14-L31C1>
# asdf-php プラグインでは locate コマンドを使う。updatedb コマンドで locate 用の DB を更新しておく。
RUN apt-get update \
  && apt-get install -y locate \
  && apt-get install -y \
    autoconf \
    bison \
    build-essential \
    curl \
    gettext \
    git \
    libgd-dev \
    libcurl4-openssl-dev \
    libedit-dev \
    libicu-dev \
    libjpeg-dev \
    libmariadb-dev-compat \
    libmariadb-dev \
    libonig-dev \
    libpng-dev \
    libpq-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libzip-dev \
    openssl \
    pkg-config \
    re2c \
    zlib1g-dev \
  && apt-get -y autoremove \
  && apt-get -y clean  \
  && rm -rf /var/cache/apt /var/lib/apt/lists \
  && /usr/bin/updatedb
