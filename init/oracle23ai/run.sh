#!/bin/bash

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

source "$ROOT/lib/common.sh"
source "$ROOT/lib/docker.sh"
source "$ROOT/lib/oracle.sh"

header "Oracle AI Database 26ai Free"

wait_container rpdm-oracle23ai

SCHEMA_DIR="$ROOT/schemas/oracle23ai"

FILES=$(find_sql_files "$SCHEMA_DIR")

if [ -z "$FILES" ]; then
    warn "No existen scripts SQL"
    exit 0
fi

for SQL in $FILES
do
    oracle_exec_sql \
        rpdm-oracle23ai \
        "$SQL" \
        FREEPDB1
done

ok "Oracle AI Database 26ai Free aprovisionado"
