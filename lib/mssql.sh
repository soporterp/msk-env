#!/bin/bash

mssql_exec_sql() {

    CONTAINER=$1
    SQLFILE=$2
    DATABASE=$3

    script_start "$SQLFILE"

    docker cp "$SQLFILE" \
        "$CONTAINER:/tmp/$(basename "$SQLFILE")"

    START=$(date +%s)

    docker exec "$CONTAINER" bash -c "
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U sa \
-P \$MSSQL_SA_PASSWORD \
-C \
-b \
-d ${DATABASE} \
-i /tmp/$(basename "$SQLFILE")
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
