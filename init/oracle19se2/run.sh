#!/bin/bash

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

source "$ROOT/lib/common.sh"
source "$ROOT/lib/docker.sh"
source "$ROOT/lib/oracle.sh"

header "Oracle 19c Standard Edition 2"

wait_container rpdm-oracle-se2

SCHEMA_DIR="$ROOT/schemas/oracle19se2"

FILES=$(find_sql_files "$SCHEMA_DIR")

if [ -z "$FILES" ]; then
    warn "No existen scripts SQL"
    exit 0
fi

for SQL in $FILES
do
    oracle_exec_sql \
        rpdm-oracle-se2 \
        "$SQL" \
        ORCLPDB1
done

ok "Oracle 19c Standard Edition 2 aprovisionado"
