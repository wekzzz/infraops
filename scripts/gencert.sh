#!/bin/bash
set -e
RED='\033[0;31m'; GREEN='\033[0;32m'; BLUE='\033[0;34m'; NC='\033[0m'

CONFIG="$(dirname "$0")/../config.yml"
DOMAIN_ARG="$1"
if [ -z "$DOMAIN_ARG" ]; then
  if command -v yq >/dev/null 2>&1; then
    DOMAIN_ARG="$(yq '.domain' "$CONFIG")"
  else
    DOMAIN_ARG="localhost"
  fi
fi

CERTS_DIR="$(dirname "$0")/../volumes/certs"
mkdir -p "$CERTS_DIR"

echo -e "${BLUE}🔐 Генерим self-signed для: $DOMAIN_ARG${NC}"
openssl req -x509 -newkey rsa:2048 -nodes -days 365 \
  -keyout "$CERTS_DIR/privkey.pem" \
  -out "$CERTS_DIR/fullchain.pem" \
  -subj "/CN=$DOMAIN_ARG"

echo -e "${GREEN}✅ Готово:${NC} $CERTS_DIR/privkey.pem, $CERTS_DIR/fullchain.pem"

