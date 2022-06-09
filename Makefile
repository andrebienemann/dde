SHELL := /bin/bash

ROOT := $(shell pwd)

COMMAND_TEMPLATE := "  \033[36m%s\033[0m %s\n"

.PHONY: help
help all:
	@if [[ "$(COMMAND)" != "help" && "$(COMMAND)" != "all" ]]; then \
		echo "Available Commands:"; \
		grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf $(COMMAND_TEMPLATE), $$1, $$2}'; \
	fi

.PHONY: build
build: ## Build an image
	@docker image build --tag andrebienemann/dde $(ROOT)

.PHONY: publish
publish: ## Publish an image
	@docker image push andrebienemann/dde
