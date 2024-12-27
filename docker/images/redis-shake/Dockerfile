FROM alpine:latest
ARG VERSION=4.3.1
ARG ARCH=amd64
WORKDIR /app
RUN apk add --no-cache wget
RUN wget -O "/app/redis-shake.tar.gz" "https://github.com/tair-opensource/RedisShake/releases/download/v$VERSION/redis-shake-v$VERSION-linux-$ARCH.tar.gz" \
    && tar xzvf /app/redis-shake.tar.gz \
    && rm shake.toml \
    && chmod +x /app/redis-shake
CMD ["./redis-shake"]