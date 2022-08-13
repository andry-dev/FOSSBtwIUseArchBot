FROM alpine:latest

RUN set -eux; \
    apk add --no-cache git build-base openssl-dev lua5.3 lua5.3-dev lua5.3-sec lua5.3-socket lua5.3-lyaml lua5.3-filesystem luarocks5.3; \
    git config --global url."https://".insteadOf git://; \
    luarocks-5.3 install telegram-bot-lua;

COPY . /app
WORKDIR /app

CMD ["lua5.3", "bot.lua"]
