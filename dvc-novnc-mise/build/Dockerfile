FROM hiro345g/dvc:novnc-202507

COPY ./script/install-mise.sh /usr/local/bin/install-mise.sh

RUN sudo -u node sh -c 'sh /usr/local/bin/install-mise.sh' \
  && mkdir -p /home/node/.local/share/mise \
  && chown -R node:node /home/node/.local/share

