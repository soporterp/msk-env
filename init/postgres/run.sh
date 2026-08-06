#!/bin/bash

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

source "$ROOT/lib/common.sh"
source "$ROOT/lib/docker.sh"
source "$ROOT/lib/postgres.sh"

header "PostgreSQL"

wait_container rpdm-postgres

SCHEMA_DIR="$ROOT/schemas/postgres"

FILES=$(find_sql_files "$SCHEMA_DIR")

if [ -z "$FILES" ]; then
    warn "No existen scripts SQL"
    exit 0
fi

for SQL in $FILES
do
    postgres_exec_sql \
        rpdm-postgres \
        "$SQL" \
        bankdb
done

ok "PostgreSQL aprovisionado"
