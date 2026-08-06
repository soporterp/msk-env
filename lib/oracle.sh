#!/bin/bash

oracle_exec_sql() {

    CONTAINER=$1
    SQLFILE=$2
    SERVICE=$3

    script_start "$SQLFILE"

    docker cp "$SQLFILE" \
        "$CONTAINER:/tmp/$(basename "$SQLFILE")"

    START=$(date +%s)

    docker exec "$CONTAINER" bash -c "
sqlplus -s system/\$ORACLE_PWD@localhost:1521/${SERVICE} <<EOF

WHENEVER SQLERROR EXIT SQL.SQLCODE

@/tmp/$(basename "$SQLFILE")

EXIT

EOF
"

    RC=$?

    END=$(date +%s)

    ELAPSED=$((END-START))

    if [ $RC -eq 0 ]; then
        script_ok "$SQLFILE" "$ELAPSED"
    else
        script_fail "$SQLFILE" "$ELAPSED"
        exit $RC
    fi

}
