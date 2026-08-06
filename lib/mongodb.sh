#!/bin/bash

mongodb_exec_js() {

    CONTAINER=$1
    JSFILE=$2

    script_start "$JSFILE"

    docker cp "$JSFILE" \
        "$CONTAINER:/tmp/$(basename "$JSFILE")"

    START=$(date +%s)

    docker exec "$CONTAINER" bash -c "
mongosh \
-u admin \
-p \$MONGO_INITDB_ROOT_PASSWORD \
--authenticationDatabase admin \
/tmp/$(basename "$JSFILE")
"

    RC=$?

    END=$(date +%s)

    ELAPSED=$((END-START))

    if [ $RC -eq 0 ]; then
        script_ok "$JSFILE" "$ELAPSED"
    else
        script_fail "$JSFILE" "$ELAPSED"
        exit $RC
    fi

}
