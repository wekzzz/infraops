#!/bin/bash
set -e

CONFIG=$1

if [ -z "$CONFIG" ]; then
  echo "❌ Ошибка: не передан путь к config.yml"
  echo "   Использование: ./scripts/deploy.sh path/to/config.yml"
  exit 1
fi

echo "🚀 Запускаем деплой (пока только рендеринг)..."

# вызываем compose.sh
sh ./scripts/compose.sh "$CONFIG"

echo "✅ Деплой завершён (docker-compose.yml сгенерирован)"

