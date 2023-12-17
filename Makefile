SHELL := /bin/bash

ROOT := $(shell pwd)

COMMAND_TEMPLATE := "  \033[36m%s\033[0m %s\n"

TAG := $(shell date '+%Y.%m')

.PHONY: help
help all:
	@if [[ "$(COMMAND)" != "help" && "$(COMMAND)" != "all" ]]; then \
		echo "Available Commands:"; \
		grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf $(COMMAND_TEMPLATE), $$1, $$2}'; \
	fi; \

.PHONY: setup
setup: ## Setup builder
	@docker buildx create --name builder; \
	docker buildx use builder; \
	docker buildx inspect --bootstrap; \

.PHONY: build
build: ## Build image
	@docker image build \
		--no-cache \
		--tag andrebienemann/dde:latest \
		--tag andrebienemann/dde:$(TAG) \
		$(ROOT); \

.PHONY: publish
publish: ## Publish image
	@docker buildx build \
		--pull --push \
		--platform linux/amd64,linux/arm64 \
		--tag andrebienemann/dde:latest \
		--tag andrebienemann/dde:$(TAG) \
		$(ROOT); \
