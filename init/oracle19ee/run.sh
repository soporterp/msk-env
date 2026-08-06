#!/bin/bash

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

source "$ROOT/lib/common.sh"
source "$ROOT/lib/docker.sh"
source "$ROOT/lib/oracle.sh"

header "Oracle 19c Enterprise"

wait_container rpdm-oracle-ee

SCHEMA_DIR="$ROOT/schemas/oracle19ee"

FILES=$(find_sql_files "$SCHEMA_DIR")

if [ -z "$FILES" ]; then
    warn "No existen scripts SQL"
    exit 0
fi

for SQL in $FILES
do
    oracle_exec_sql \
        rpdm-oracle-ee \
        "$SQL" \
        ORCLPDB1
done

ok "Oracle EE aprovisionado"
