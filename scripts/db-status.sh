#!/bin/bash

echo "======================================"
echo " Estado del laboratorio RPDM"
echo "======================================"
echo

docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo
echo "======================================"
echo " Uso de disco"
echo "======================================"

du -sh /u01/databases/* 2>/dev/null
