#!/bin/bash

set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_DIR="$ROOT_DIR/compose"
ENV_FILE="$COMPOSE_DIR/.env"

echo "======================================"
echo " Deteniendo laboratorio RPDM"
echo "======================================"

if [ ! -f "$ENV_FILE" ]; then
    echo "[ERROR] No existe:"
    echo "        $ENV_FILE"
    exit 1
fi

cd "$COMPOSE_DIR"

docker compose \
    --env-file "$ENV_FILE" \
    --profile core \
    -f docker-compose.yml \
    -f oracle19ee.yml \
    -f oracle19se2.yml \
    -f oracle23ai.yml \
    -f postgres.yml \
    -f mysql.yml \
    -f mongodb.yml \
    -f mssql.yml \
    down

echo
echo "Laboratorio detenido."
