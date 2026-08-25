#!/bin/bash

set -e

echo "======================================"
echo " Oracle AI Database 26ai Free"
echo "======================================"

docker exec -it rpdm-oracle23ai bash -c \
'sqlplus system/$ORACLE_PWD@localhost:1521/FREEPDB1'
