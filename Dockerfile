# refs: https://qiita.com/kengo-sk8/items/9b5ecd614a413412da75#docker%E9%96%A2%E9%80%A3%E3%81%AE%E6%A7%8B%E7%AF%89
# ベースイメージを指定
ARG RUBY_VERSION=3.4.2
FROM ruby:${RUBY_VERSION}-slim-bookworm

# 環境変数の設定
ENV LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    RUBY_YJIT_ENABLE=1 \
    RAILS_ENV=development \
    APP_ROOT_PATH=/web1

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    libgmp-dev \
    libssl-dev \
    libmariadb-dev-compat \
    curl \
    git \
    libyaml-dev \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリを設定
WORKDIR ${APP_ROOT_PATH}

# Gemfile と Gemfile.lock をコピーし、依存関係をインストール
COPY Gemfile Gemfile.lock ${APP_ROOT_PATH}/
RUN bundle install

# プロジェクトのソースコードをコピー
COPY . ${APP_ROOT_PATH}/
