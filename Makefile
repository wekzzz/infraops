CONFIG=config.yml

.PHONY: help deploy

help:
	@echo "Deploy script"

deploy:
	./scripts/deploy.sh $(config)
