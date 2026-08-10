#
# Task runner for this project's development lifecycle. Each target wraps a
# same-named script in `run/`.
#
# See: docs > development > tools.
#

.DEFAULT_GOAL := help

install: ## Install project dependencies
	./run/install

build: ## Build production-grade artifacts
	./run/build

test: ## Run the automated test suite
	./run/test

lint: ## Run the linter
	./run/lint

version: ## Tag a release point
	./run/version

clean: ## Remove build output and caches
	./run/clean

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: install build test lint version clean help
