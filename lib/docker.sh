#!/bin/bash

wait_container() {

    CONTAINER=$1

    printf "Esperando %s " "$CONTAINER"

    until [ "$(docker inspect \
        -f '{{.State.Health.Status}}' \
        "$CONTAINER" 2>/dev/null)" = "healthy" ]
    do
        printf "."
        sleep 5
    done

    echo " OK"

}
