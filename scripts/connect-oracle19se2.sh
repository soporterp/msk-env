#!/bin/bash

set -e

echo "======================================"
echo " Oracle 19c Standard Edition 2"
echo "======================================"

docker exec -it rpdm-oracle-se2 bash -c \
'sqlplus system/$ORACLE_PWD@localhost:1521/ORCLPDB1'
