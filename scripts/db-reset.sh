#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "======================================"
echo " Reiniciando laboratorio RPDM"
echo "======================================"

"$SCRIPT_DIR/db-down.sh"

echo
echo "Esperando 5 segundos..."
sleep 5

"$SCRIPT_DIR/db-up.sh"

echo
echo "Estado final:"
echo

"$SCRIPT_DIR/db-status.sh"
