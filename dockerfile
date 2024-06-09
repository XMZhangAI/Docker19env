FROM ubuntu:latest

# 安装基本依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# 安装 Python
RUN apt-get update && apt-get install -y python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python

# 安装 Node.js 和 JavaScript 运行环境
RUN apt-get update && apt-get install -y nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

# 安装 Java
RUN apt-get update && apt-get install -y default-jdk

# 安装 Go
RUN wget https://golang.org/dl/go1.17.6.linux-amd64.tar.gz
RUN tar -xvf go1.17.6.linux-amd64.tar.gz
RUN mv go /usr/local
ENV GOROOT=/usr/local/go
ENV PATH=$GOROOT/bin:$PATH

# 安装 Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# 安装 PHP
RUN apt-get update && apt-get install -y php

# 安装 TypeScript
RUN npm install -g typescript

# 安装 Kotlin
RUN apt-get update && apt-get install -y kotlin

# 安装 Scala
RUN apt-get update && apt-get install -y scala

# 安装 Swift
RUN apt-get update && apt-get install -y swift

# 安装 Ruby
RUN apt-get update && apt-get install -y ruby

# 安装 Elixir
RUN apt-get update && apt-get install -y elixir

# 安装 Dart
RUN apt-get update && apt-get install -y apt-transport-https && \
    sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
    sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list' && \
    apt-get update && apt-get install -y dart

# 安装 Erlang
RUN apt-get update && apt-get install -y erlang

# 创建工作目录
WORKDIR /workspace

# 设置默认命令
CMD ["bash"]
