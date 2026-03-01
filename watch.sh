#!/bin/bash
set -euo pipefail

# Source - https://stackoverflow.com/a/43008569
# Posted by JRichardsz, modified by community. See post 'Timeline' for change history
# Retrieved 2026-03-01, License - CC BY-SA 4.0
for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done
# from this line, you could use your variables as you need

# check required variables early
: "${TELEGRAM_BOT_TOKEN:?TELEGRAM_BOT_TOKEN must be set}"
: "${TELEGRAM_CHAT_ID:?TELEGRAM_CHAT_ID must be set}"


inotifywait -m -r -e delete --format '%f' "/watch_dir" | while read FILE
do
    EXT="${FILE##*.}"
    EXT_LOWER=$(echo "$EXT" | tr '[:upper:]' '[:lower:]')

    if [ "$EXT_LOWER" != "xmp" ]; then
        MESSAGE="ALERTE NAS - Suppression détectée : $FILE"
        curl -s -X POST https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage -d chat_id=$TELEGRAM_CHAT_ID -d text="$MESSAGE" > /dev/null
    fi
done