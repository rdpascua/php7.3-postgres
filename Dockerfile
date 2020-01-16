FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

# Update repository and install basic dependencies
RUN apt-get update && apt-get install -y \
    wget \
    git \
    unzip \
    sudo \
    curl \
    software-properties-common

# Install latest php
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php7.3 \
    php7.3-xml \
    php7.3-gd \
    php7.3-pgsql \
    php7.3-mbstring \
    php7.3-curl \
    php7.3-zip \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Install Java
RUN apt-get install -y default-jre

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8

# Install Postgres9.6
RUN add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
    && apt-get update \
    && apt-get install -y postgresql-10