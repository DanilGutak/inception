FROM alpine:3.18

RUN apk update && apk upgrade && \
    apk add redis && \
    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g"  /etc/redis.conf && \
    echo "maxmemory 20mb" >> /etc/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf


CMD [ "redis-server" , "/etc/redis.conf" ]