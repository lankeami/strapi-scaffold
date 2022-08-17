.PHONY: local start start-lite restart stop build rebuild logs shell
SHELL = /bin/sh

PROJECT = strapi-scaffold
ID=$(shell (docker ps | grep $(PROJECT) | awk '{print $$1}'))

local: ## spin it up and watch the logs
local: stop rebuild start logs

build: ## build the container to run the vue app
	docker build -t $(PROJECT) .

rebuild: ## rebuild the container without caches to run the vue app
	rm -rf node_modules; docker build --no-cache -t $(PROJECT) .

start: ## run the vue app (runs npm install and build)
	docker run -d -v $(PWD)/app:/srv/app -it -e HOST=0.0.0.0 --expose 1337 -p 1337:1337 $(PROJECT)

stop: ## stop a running container
	docker container stop $(ID) || echo "stopped already"

restart: ## stop then start the node app
restart: stop start logs

logs: ## tail the logs of the container
	docker logs -f $(ID)

shell: ## jump onto the container
	docker exec -it $(ID) sh

help: ## show targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-18s\033[0m %s\n", $$1, $$2}'
