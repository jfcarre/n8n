# Use the latest official n8n image as the base
FROM n8nio/n8n:latest
FROM caddy:alpine

# Copy local files (if needed)
COPY . .

# Expose the n8n port
EXPOSE 5678

# Start n8n when the container runs
CMD ["n8n start"]
