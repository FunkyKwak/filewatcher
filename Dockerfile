FROM alpine:latest

RUN apk add --no-cache inotify-tools msmtp mailx bash curl

ARG TELEGRAM_BOT_TOKEN
ARG TELEGRAM_CHAT_ID

WORKDIR /app
COPY watch.sh /app/watch.sh
RUN chmod +x /app/watch.sh TELEGRAM_BOT_TOKEN="$TELEGRAM_BOT_TOKEN" TELEGRAM_CHAT_ID="$TELEGRAM_CHAT_ID"

CMD ["/app/watch.sh"]