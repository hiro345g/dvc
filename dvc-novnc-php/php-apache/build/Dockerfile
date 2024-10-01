FROM php:8.2-apache

ARG USER_NAME=www-data
ARG USER_UID=1000
ARG USER_GID=1000

RUN apt-get update && apt-get install -y libonig-dev git bash-completion sudo \
    && pecl install xdebug-3.3.2 \
    && docker-php-ext-install pdo_mysql mysqli mbstring \
    && docker-php-ext-enable xdebug \
    && usermod -u ${USER_UID} ${USER_NAME} \
    && groupmod -g ${USER_GID} ${USER_NAME} \
    && echo "${USER_NAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USER_NAME} \
    && chmod 440 /etc/sudoers.d/${USER_NAME} \ 
    && chown -R ${USER_NAME}:${USER_NAME} /var/www \
    && chsh -s /bin/bash ${USER_NAME}
