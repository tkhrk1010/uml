.DEFAULT_GOAL := help

start: ## run plantuml server
	@printf '\033[34m%s\033[m\n' 'docker run -d -p 8081:8080 --name plantuml-server plantuml/plantuml-server:jetty'
	@docker run -d -p 8081:8080 --name plantuml-server plantuml/plantuml-server:jetty

stop: ## stop plantuml server
	@docker container stop plantuml-server

ls: ## list container
	@printf '\033[34m%s\033[m\n' 'docker container ls'
	@docker container ls

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

