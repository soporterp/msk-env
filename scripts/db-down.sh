#!/bin/bash

set -e

echo "======================================"
echo " Deteniendo laboratorio RPDM"
echo "======================================"

docker compose \
    --env-file .env \
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
