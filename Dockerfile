# Usa la imagen oficial de N8n como base
FROM n8nio/n8n:latest

# Instala Python en el contenedor
USER root
RUN apt-get update && apt-get install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*

# Cambia al usuario N8n para mayor seguridad
USER node

# Establece el directorio de trabajo
WORKDIR /data

# Expone el puerto 5678 (donde corre N8n)
EXPOSE 5678

# Comando para iniciar N8n
CMD ["n8n"]
