FROM alpine:latest

# install required packages in one apk command; curl is available on alpine
RUN apk add --no-cache inotify-tools msmtp mailx bash curl


WORKDIR /app
COPY watch.sh /app/watch.sh
RUN chmod +x /app/watch.sh

CMD ["/app/watch.sh"]