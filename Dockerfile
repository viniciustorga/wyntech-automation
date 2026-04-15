FROM node:18-alpine

# Install dumb-init for proper signal handling
RUN apk add --no-cache dumb-init

WORKDIR /app

# Install n8n globally
RUN npm install -g n8n

# Create a non-root user
RUN addgroup -g 1001 -S n8nuser && \
    adduser -S n8nuser -u 1001

    # Create necessary directories with proper permissions
    RUN mkdir -p /home/n8nuser/.n8n && \
        chown -R n8nuser:n8nuser /home/n8nuser

        USER n8nuser

        # Expose the n8n port
        EXPOSE 5678

        # Health check
        HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
            CMD node -e "require('http').get('http://localhost:5678/healthz', (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

            # Use dumb-init to handle signals properly
            ENTRYPOINT ["dumb-init", "--"]

            # Start n8n
CMD ["n8n"]
