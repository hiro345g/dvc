FROM hiro345g/dvc:base-202601

COPY ./menu /home/node/.fluxbox/menu
COPY ./startup /home/node/.fluxbox/startup

# https://chromium.googlesource.com/chromium/src/+/HEAD/LICENSE
# https://www.mozilla.org/ja/about/legal/terms/firefox/
RUN apt-get update && apt-get -y upgrade \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        ibus \
        bash-completion \
        firefox-esr-l10n-ja \
        chromium chromium-l10n \
    && apt-get -y autoremove \
    && apt-get -y clean  \
    && rm -rf /var/cache/apt /var/lib/apt/lists \
    && mkdir -p /home/node/workspace /home/node/.vscode-server/extensions \
    && cp -r /usr/local/share/npm-global/ /home/node/workspace/.npm-global \
    && chown -R node:node /home/node/workspace /home/node/workspace/.npm-global \
            /home/node/.vscode-server /home/node/.fluxbox /home/node/.bashrc
