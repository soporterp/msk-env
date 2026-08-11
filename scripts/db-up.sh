#!/bin/bash

set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_DIR="$ROOT_DIR/compose"
ENV_FILE="$COMPOSE_DIR/.env"

echo "======================================"
echo " Iniciando laboratorio RPDM"
echo " Perfil: core"
echo "======================================"

if [ ! -f "$ENV_FILE" ]; then
    echo "[ERROR] No existe:"
    echo "        $ENV_FILE"
    echo
    echo "Copia .env.example como .env y configura los valores."
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
    up -d

echo
docker ps \
    --filter "name=rpdm-" \
    --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
