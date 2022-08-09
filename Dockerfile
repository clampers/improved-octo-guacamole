FROM alpine:3.13

ARG COMMIT_HASH

LABEL maintainer="abarrett@heartland.com"
LABEL commit=${COMMIT_HASH}

WORKDIR /app

RUN \
    apk upgrade --update \
    && apk add \
    npm \
    && npm add -g npm @11ty/eleventy \
    && apk search --update ;

EXPOSE 8080