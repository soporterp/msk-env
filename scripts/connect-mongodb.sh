#!/bin/bash

set -e

echo "======================================"
echo " MongoDB 8"
echo "======================================"

docker exec -it rpdm-mongodb \
mongosh \
-u admin \
-p 'redPartner1' \
--authenticationDatabase admin
