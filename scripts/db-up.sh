#!/bin/bash

set -e

PROFILE=${1:-core}

BASE_CMD="docker compose --env-file .env --profile ${PROFILE}"

echo "======================================"
echo " Iniciando laboratorio RPDM"
echo " Perfil: ${PROFILE}"
echo "======================================"

FILES=""

FILES="$FILES -f docker-compose.yml"

[ -f oracle19ee.yml ] && FILES="$FILES -f oracle19ee.yml"
[ -f oracle19se2.yml ] && FILES="$FILES -f oracle19se2.yml"
[ -f oracle23ai.yml ] && FILES="$FILES -f oracle23ai.yml"
[ -f postgres.yml ] && FILES="$FILES -f postgres.yml"
[ -f mysql.yml ] && FILES="$FILES -f mysql.yml"
[ -f mongodb.yml ] && FILES="$FILES -f mongodb.yml"
[ -f mssql.yml ] && FILES="$FILES -f mssql.yml"

eval ${BASE_CMD} ${FILES} up -d

echo
docker ps
