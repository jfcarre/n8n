# Use the latest official n8n image as the base
FROM n8nio/n8n:latest
FROM caddy:alpine

# Set the working directory
WORKDIR /home/node/

# Copy local files (optional, if needed)
COPY . .

# Set correct permissions
RUN chown -R node:node /home/node/

# Switch to non-root user for security
USER node

# Expose the n8n default port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
