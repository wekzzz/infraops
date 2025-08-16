#!/bin/bash
set -e

gomplate -f ../docker-compose.template.yml -c .="../config.yml" -o ../docker-compose.yml

echo "✅ docker-compose.yml ready!"
