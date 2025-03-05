# Use an official Node.js runtime as a parent image for n8n
FROM docker.n8n.io/n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Install Caddy
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://getcaddy.com | bash

# Install PostgreSQL client (optional, if needed)
RUN apt-get install -y postgresql-client

# Copy local files for n8n
COPY . /home/node/

# Set environment variables (Railway will override these)
ENV N8N_HOST=n8n-production-8f51.up.railway.app
ENV WEBHOOK_URL=https://n8n-production-8f51.up.railway.app
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV DB_TYPE=postgresdb

# Expose required ports
EXPOSE 5678 80 443

# Start services
CMD ["sh", "-c", "caddy run & n8n"]
