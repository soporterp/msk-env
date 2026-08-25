#!/bin/bash

set -e

echo "======================================"
echo " Oracle 19c Enterprise"
echo "======================================"

docker exec -it rpdm-oracle-ee bash -c \
'sqlplus system/$ORACLE_PWD@localhost:1521/ORCLPDB1'
