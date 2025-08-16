CONFIG=../config.yml

.PHONY: help render deploy

help:
	@echo "🚀 Makefile команды:"
	@echo "  make render   - сгенерировать docker-compose.yml"
	@echo "  make cert     - сгенерировать cert"
	@echo "  make deploy   - задеплоить проект"

render:
	@sudo sh ./scripts/compose.sh $(CONFIG)

cert:
	@sudo sh ./scripts/gencert.sh $(DOMAIN)

deploy:
	@sudo sh ./scripts/deploy.sh $(CONFIG)

