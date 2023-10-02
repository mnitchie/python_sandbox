.DEFAULT_GOAL := help

.PHONY: build \
        help \
        start \
        start_jupyter \
        start_vanilla \
        _notImplemented \

# Build the docker images
build:
	docker build --target base-env -t python_sandbox_vanilla .
	docker build --target jupyter-env -t python_sandbox_jupyter .

# Show help
help:
	@echo "Usage: make [recipe]\n\nRecipes:"
	@grep -h '##' $(MAKEFILE_LIST) | grep -v grep | sed -e 's/\(.*\):.*## \(.*\)/\1|    \2/' | tr '|' '\n'

# Start vanilla docker container
start: build
	docker run -it --rm -v $(shell pwd):/usr/src/app --name python_sandbox_vannilla python_sandbox_vanilla

start_jupyter: build
	docker run -it --rm -p 8888:8888 -v $(shell pwd):/usr/src/app --name python_sandbox_jupyter python_sandbox_jupyter

# Placeholder for not implemented targets
_notImplemented:
	@echo "This target is not yet implemented"
