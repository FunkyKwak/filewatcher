# filewatcher

Surveille les suppressions de fichiers dans un répertoire et envoie des alertes via Telegram.

## Utilisation rapide

### Prérequis
- **Docker** et **Docker Compose** installés

### Étapes

1. Copier `sample.env` en `.env` et remplir les trois variables, puis lancer :
   ```sh
   docker compose up -d
   ```

C'est tout ! L'image est automatiquement téléchargée depuis le registry public (GHCR).

Le volume `WATCH_DIR` sera monté en lecture seule dans `/watch_dir` et le script
`watch.sh` s'exécute en continu dans le conteneur.

## Configuration

Éditer le fichier `.env` avec :
- **WATCH_DIR** : Le répertoire à surveiller
- **TELEGRAM_BOT_TOKEN** : Token du bot Telegram
- **TELEGRAM_CHAT_ID** : ID du chat destinataire

## Développement local

Pour tester des modifications, décommentez `build: .` dans `compose.yaml` et lancez `docker compose build --no-cache` puis `docker compose up -d`.

## Publication automatique

L'image est publiée automatiquement sur [GHCR](https://ghcr.io) à chaque tag/release via GitHub Actions. Les images sont disponibles publiquement sans authentification requise.
