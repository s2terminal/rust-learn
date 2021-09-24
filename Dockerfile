FROM rust:slim
WORKDIR /app

RUN apt-get update && apt-get install -y \
  git \
  build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN rustup update
RUN rustup target add x86_64-unknown-linux-musl

COPY ./ ./
RUN cargo build

CMD cargo run
