#!/bin/bash
set -euo pipefail


# check required variables early
: "${TELEGRAM_BOT_TOKEN:?TELEGRAM_BOT_TOKEN must be set}"
: "${TELEGRAM_CHAT_ID:?TELEGRAM_CHAT_ID must be set}"


# log startup
echo "[watch.sh] starting inotify monitoring on /watch_dir"

inotifywait -m -r -e delete --format '%f' "/watch_dir" | while read FILE
do
    EXT="${FILE##*.}"
    EXT_LOWER=$(echo "$EXT" | tr '[:upper:]' '[:lower:]')

    if [ "$EXT_LOWER" != "xmp" ]; then
        MESSAGE="ALERTE NAS - Suppression détectée : $FILE"
        # log before sending telegram message
        echo "[watch.sh] sending telegram notification: $MESSAGE"
        curl -s -X POST https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage -d chat_id=$TELEGRAM_CHAT_ID -d text="$MESSAGE" > /dev/null
    fi
done