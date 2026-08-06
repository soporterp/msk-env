#!/bin/bash

mysql_exec_sql() {

    CONTAINER=$1
    SQLFILE=$2
    DATABASE=$3

    script_start "$SQLFILE"

    docker cp "$SQLFILE" \
        "$CONTAINER:/tmp/$(basename "$SQLFILE")"

    START=$(date +%s)

    docker exec "$CONTAINER" bash -c "
mysql \
-uroot \
-p\$MYSQL_ROOT_PASSWORD \
${DATABASE} \
< /tmp/$(basename "$SQLFILE")
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
