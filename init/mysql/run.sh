#!/bin/bash

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

source "$ROOT/lib/common.sh"
source "$ROOT/lib/docker.sh"
source "$ROOT/lib/mysql.sh"

header "MySQL"

wait_container rpdm-mysql

SCHEMA_DIR="$ROOT/schemas/mysql"

FILES=$(find_sql_files "$SCHEMA_DIR")

if [ -z "$FILES" ]; then
    warn "No existen scripts SQL"
    exit 0
fi

for SQL in $FILES
do
    mysql_exec_sql \
        rpdm-mysql \
        "$SQL" \
        bankdb
done

ok "MySQL aprovisionado"
