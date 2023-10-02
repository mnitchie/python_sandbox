.DEFAULT_GOAL := help

.PHONY: build \
        help \
        start \
        start_jupyter \
        start_vanilla \
        _notImplemented \
        _start-%

# Build the docker images
build:
	docker build -t python_sandbox_vanilla -f Dockerfile.base .
	docker build -t python_sandbox_jupyter -f Dockerfile.jupyter .

# Show help
help:
	@echo "Usage: make [recipe]\n\nRecipes:"
	@grep -h '##' $(MAKEFILE_LIST) | grep -v grep | sed -e 's/\(.*\):.*## \(.*\)/\1|    \2/' | tr '|' '\n'

# Start the docker container
_start-%: build
	docker run -it --rm --name python_sandbox_$* python_sandbox_$* bash

# Start vanilla docker container
start: start_vanilla
start_vanilla: _start-vanilla
start_jupyter: _start-jupyter

# Placeholder for not implemented targets
_notImplemented:
	@echo "This target is not yet implemented"
