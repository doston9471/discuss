PROJECT ?= discuss

export PROJECT

dev-build:
	docker-compose -p $(PROJECT) build

dev-up:
	docker-compose -p $(PROJECT) up -d

dev-up-build:
	docker-compose -p $(PROJECT) up -d --build

bash:
	docker-compose -p $(PROJECT) exec web bash


dev: dev-up-build bash


logs-web:
	docker-compose -p $(PROJECT) logs --follow --tail 100 web

test:
	docker-compose -p $(PROJECT) exec web rspec

down:
	docker-compose \
		-p $(PROJECT) \
		down \
		--remove-orphans

docker-clean:
	docker system prune --all --volumes