# https://github.com/devcontainers/images/tree/main/src/typescript-node
FROM mcr.microsoft.com/devcontainers/typescript-node:22-bookworm

COPY ./node.dot.bashrc /home/node/.bashrc
COPY ./node.dot.npmrc /home/node/.npmrc

RUN apt-get update && apt-get -y upgrade \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        curl \
        task-japanese \
        fonts-vlgothic \
        bash-completion \
        iproute2 \
        iputils-ping \
        dnsutils \
    && apt-get -y autoremove \
    && apt-get -y clean  \
    && rm -rf /var/cache/apt /var/lib/apt/lists \
    && sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen \
    && locale-gen \
    && rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && mkdir -p /home/node/workspace /home/node/.vscode-server/extensions \
    && cp -r /usr/local/share/npm-global/ /home/node/workspace/.npm-global \
    && chown -R node:node \
        /home/node/workspace \
        /home/node/workspace/.npm-global \
        /home/node/.vscode-server /home/node/.bashrc

# https://github.com/yuru7/HackGen?tab=License-1-ov-file#readme
RUN curl -s -L -O https://github.com/yuru7/HackGen/releases/download/v2.10.0/HackGen_NF_v2.10.0.zip \
    && unzip HackGen_NF_v2.10.0.zip \
    && rm HackGen_NF_v2.10.0.zip \
    && mv HackGen_NF_v2.10.0 /usr/local/share/fonts/HackGen_NF
