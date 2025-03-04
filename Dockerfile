# Usa la imagen oficial de N8n como base
FROM n8nio/n8n:latest

ARG N8N_VERSION

RUN if [ -z "$N8N_VERSION" ] ; then echo "The N8N_VERSION argument is missing!" ; exit 1; fi

# Update everything and install needed dependencies
RUN apk add --update graphicsmagick tzdata

# Set a custom user to not have n8n run as root
USER root
RUN apk --update add --virtual build-dependencies python build-base ca-certificates && \
	npm_config_user=root npm install -g n8n@${N8N_VERSION} && \
	apk del build-dependencies

# Cambia al usuario N8n para mayor seguridad
USER node

# Establece el directorio de trabajo
WORKDIR /data

# Expone el puerto 5678 (donde corre N8n)
EXPOSE 5678

# Comando para iniciar N8n
CMD ["n8n"]
