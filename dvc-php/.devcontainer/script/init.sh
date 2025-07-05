#!/bin/sh
echo "$(date '+%Y-%m-%dT%H:%M:%S+09:00') init" >> /home/node/workspace/init.log

#
# `mise -y use --global php@system` 実行相当
#
if [ ! -e /home/node/.config/mise/ ]; then
    mkdir -p /home/node/.config/mise/
fi
cat << EOS > /home/node/.config/mise/config.toml 
[tools]
php = "system"
EOS
