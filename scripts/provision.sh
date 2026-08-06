#!/bin/bash

set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo
echo "========================================"
echo " RPDM Database Provisioning Framework"
echo "========================================"
echo

DATABASES=(
    oracle19ee
    oracle19se2
    oracle23ai
    postgres
    mysql
    mongodb
    mssql
)
START=$(date +%s)

for DB in "${DATABASES[@]}"
do
    echo "----------------------------------------"
    echo "Inicializando ${DB}"
    echo "----------------------------------------"

    RUN_SCRIPT="${ROOT_DIR}/init/${DB}/run.sh"

    if [ ! -f "$RUN_SCRIPT" ]; then
        echo "[ERROR] No existe ${RUN_SCRIPT}"
        continue
    fi

    bash "$RUN_SCRIPT"

    echo
done

END=$(date +%s)

echo
echo "========================================"
echo "Provisioning finalizado"
echo "========================================"
echo

echo "Tiempo total: $((END-START)) segundos"
