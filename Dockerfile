# Use the latest official n8n image as the base
FROM n8nio/n8n:latest
# FROM caddy:alpine
#FROM node:18-alpine

#RUN apk add --update graphicsmagick tzdata

USER root

# Variables for postgresql
ARG DB_POSTGRESDB_PASSWORD
ARG DB_POSTGRESDB_HOST
ARG DB_POSTGRESDB_PORT
ARG DB_POSTGRESDB_DATABASE
ARG DB_POSTGRESDB_USER

# Variables for n8n
ARG USERNAME
ARG PASSWORD

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=$DB_POSTGRESDB_DATABASE
ENV DB_POSTGRESDB_HOST=$DB_POSTGRESDB_HOST
ENV DB_POSTGRESDB_PORT=$DB_POSTGRESDB_PORT
ENV DB_POSTGRESDB_USER=$DB_POSTGRESDB_USER
ENV DB_POSTGRESDB_PASSWORD=$DB_POSTGRESDB_PASSWORD

ENV N8N_BASIC_AUTH_ACTIVE=$N8N_BASIC_AUTH_ACTIVE
ENV N8N_BASIC_AUTH_USER=$USERNAME
ENV N8N_BASIC_AUTH_PASSWORD=$PASSWORD

ENV ENABLE_ALPINE_PRIVATE_NETWORKING=true

# RUN apk --update add --virtual build-dependencies python3 build-base && \
#    npm_config_user=root npm install --location=global n8n && \
#    apk del build-dependencies

# Copy local files (if needed)
#WORKDIR /data
EXPOSE 5678

CMD ["n8n"]
