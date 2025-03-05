# Use the latest official n8n image as the base
#FROM n8nio/n8n:latest
# FROM caddy:alpine

FROM node:18-alpine

RUN apk add --update graphicsmagick tzdata

USER root


RUN apk --update add --virtual build-dependencies python3 build-base && \
    npm_config_user=root npm install --location=global n8n && \
    apk del build-dependencies

# Copy local files (if needed)
WORKDIR /data
EXPOSE 5678

CMD ["n8n"]
