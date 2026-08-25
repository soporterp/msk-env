#!/bin/bash

set -e

echo "======================================"
echo " Microsoft SQL Server 2022"
echo "======================================"

docker exec -it rpdm-mssql \
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U sa \
-P 'redPartner1' \
-C
