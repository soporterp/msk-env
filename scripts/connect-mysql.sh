#!/bin/bash

set -e

echo "======================================"
echo " MySQL 8.4"
echo "======================================"

docker exec -it rpdm-mysql \
mysql -uroot -p
