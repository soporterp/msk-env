#!/bin/bash

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

source "$ROOT/lib/common.sh"
source "$ROOT/lib/docker.sh"
source "$ROOT/lib/mongodb.sh"

header "MongoDB"

wait_container rpdm-mongodb

SCHEMA_DIR="$ROOT/schemas/mongodb"

FILES=$(find_js_files "$SCHEMA_DIR")

if [ -z "$FILES" ]; then
    warn "No existen scripts JS"
    exit 0
fi

for JS in $FILES
do
    mongodb_exec_js \
        rpdm-mongodb \
        "$JS"
done

ok "MongoDB aprovisionado"
