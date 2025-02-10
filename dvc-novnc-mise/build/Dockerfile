FROM hiro345g/dvc:novnc-202502

COPY ./script/install-mise.sh /usr/local/bin/install-mise.sh
COPY ./script/update-mise.sh /usr/local/bin/update-mise.sh

RUN sudo -u node sh -c 'sh /usr/local/bin/install-mise.sh' \
  && mkdir -p /home/node/.local/share/mise \
  && chown -R node:node /home/node/.local/share \
  && sudo -u node sh -c 'bash /usr/local/bin/update-mise.sh'