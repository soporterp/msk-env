#!/bin/bash

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

source "$ROOT/lib/common.sh"
source "$ROOT/lib/docker.sh"
source "$ROOT/lib/mssql.sh"

header "Microsoft SQL Server"

wait_container rpdm-mssql

SCHEMA_DIR="$ROOT/schemas/mssql"

FILES=$(find_sql_files "$SCHEMA_DIR")

if [ -z "$FILES" ]; then
    warn "No existen scripts SQL"
    exit 0
fi

for SQL in $FILES
do
    mssql_exec_sql \
        rpdm-mssql \
        "$SQL" \
        bankdb
done

ok "SQL Server aprovisionado"
