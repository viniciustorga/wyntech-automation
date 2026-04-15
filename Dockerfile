FROM n8nio/n8n:latest

EXPOSE 5678

ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_HOST=wyntech-automation.onrender.com
ENV WEBHOOK_URL=https://wyntech-automation.onrender.com/
ENV GENERIC_TIMEZONE=Europe/Lisbon
ENV TZ=Europe/Lisbon
