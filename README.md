# filewatcher

Surveille les suppressions de fichiers dans un répertoire et envoie des alertes via Telegram.

## Utilisation

1. Copier `sample.env` en `.env` et remplir les trois variables :
   ```dotenv
   WATCH_DIR=/chemin/à/surveiller
   TELEGRAM_BOT_TOKEN=token_du_bot
   TELEGRAM_CHAT_ID=id_du_chat
   ```

2. Construire l'image :
   ```sh
   docker compose build
   ```

3. Lancer la stack :
   ```sh
   docker compose up -d
   ```

Le volume `WATCH_DIR` sera monté en lecture seule dans `/watch_dir` et le script
`watch.sh` s'exécute en continu dans le conteneur.



## Environment variables
I added the file "sample.env" just as a sample. You need to create a .env file with the same structure, and your actual values of the variables.
 - WATCH_DIR : The directory you want to watch
 - TELEGRAM_BOT_TOKEN : your_bot_token
 - TELEGRAM_CHAT_ID : your_chat_id
