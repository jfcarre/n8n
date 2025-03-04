# Use the latest official n8n image as the base
FROM n8nio/n8n:latest
FROM caddy:alpine

# Set the working directory
WORKDIR /home/node/

# Copy local files (if needed)
COPY . .

# Ensure the correct permissions
USER root
RUN chown -R node:node /home/node/

# Switch to a non-root user for security
USER node

# Expose the n8n port
EXPOSE 5678

# Start n8n when the container runs
CMD ["n8n"]
