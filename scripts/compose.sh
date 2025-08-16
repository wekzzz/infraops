#!/bin/bash
set -e

# Красивые цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Конфиг всегда в devops/
CONFIG="$(dirname "$0")/../config.yml"

# Проверка, что файл есть
if [ ! -f "$CONFIG" ]; then
  echo -e "${RED}❌ Ошибка:${NC} не найден $CONFIG"
  exit 1
fi

echo -e "${BLUE}🔧 Рендерим docker-compose.yml...${NC}"
gomplate \
  -f "$(dirname "$0")/../docker-compose.template.yml" \
  -c .="$CONFIG" \
  -o "$(dirname "$0")/../docker-compose.yml"

echo -e "${GREEN}✅ docker-compose.yml готов!${NC}"

