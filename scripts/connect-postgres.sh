#!/bin/bash

set -e

echo "======================================"
echo " PostgreSQL 17"
echo "======================================"

docker exec -it rpdm-postgres \
psql -U postgres -d bankdb
