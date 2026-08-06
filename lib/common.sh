#!/bin/bash

header() {

    echo
    echo "=================================================="
    echo "$1"
    echo "=================================================="

}

ok() {

    echo "[ OK ] $1"

}

warn() {

    echo "[WARN] $1"

}

error() {

    echo "[FAIL] $1"

}

info() {

    echo "[INFO] $1"

}

run_timer() {

    START=$(date +%s)

}

script_start() {

    FILE=$1

    echo
    echo "------------------------------------------"
    echo " Script : $(basename "$FILE")"
    echo "------------------------------------------"

}

script_ok() {

    FILE=$1
    TIME=$2

    echo "[ OK ] $(basename "$FILE") (${TIME}s)"

}

script_fail() {

    FILE=$1
    TIME=$2

    echo "[FAIL] $(basename "$FILE") (${TIME}s)"

}

find_sql_files() {

    local DIR=$1

    find "$DIR" \
        -type f \
        -name "*.sql" \
        | sort

}

find_js_files() {

    local DIR=$1

    find "$DIR" \
        -type f \
        -name "*.js" \
        | sort

}

stop_timer() {

    END=$(date +%s)

    echo "[ OK ] Tiempo: $((END-START)) segundos"

}
