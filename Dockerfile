FROM php:7.3.30-buster

# マルチステージビルドの活用
COPY --from=composer:1.10.20 /usr/bin/composer /usr/bin/composer

# 以下をインストール
# - 拡張機能のためのライブラリ
# - DBのクライアント
# - 日本語フォントと言語設定用ツール
# - git
RUN apt-get update \
    && apt-get install -y \
        --no-install-recommends \
        libmcrypt-dev libicu-dev \
        libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
        libzip-dev zip \
        libpq-dev \
        postgresql-client-11 \
        fonts-ipafont \
        fonts-ipaexfont \
        fontconfig \
        locales \
        git \
    && rm -rf /var/lib/apt/lists/* \
    && fc-cache -f

# php拡張機能のインストール
# dockerの場合は、docker-php-ext-installでインストールする
RUN docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure gd --with-freetype-dir --with-jpeg-dir \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip pdo pdo_pgsql

# 日本語設定
RUN locale-gen ja_JP.UTF-8 \
    && localedef -f UTF-8 -i ja_JP ja_JP.utf8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:jp
ENV LC_ALL ja_JP.UTF-8