.DEFAULT_GOAL := help

.PHONY: 
	build $\
	help $\
	_notImplemented $\

build: # build the docker image
	docker build -t python_sandbox .

help: ## show help
	@echo "Usage: make [recipe]\n\nRecipes:"
	@grep -h '##' $(MAKEFILE_LIST) | grep -v grep | sed -e 's/\(.*\):.*## \(.*\)/\1|    \2/' | tr '|' '\n'

start: build## start the docker container
	docker run -it --rm --name python_sandbox python_sandbox bash

_notImplemented:
	@echo "This target is not yet implemented"