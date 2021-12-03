PROJECT ?= discuss

export PROJECT

dev-build:
		docker-compose --project-directory docker -p $(PROJECT) build

dev-up:
		docker-compose --project-directory docker -p $(PROJECT) up -d

dev-up-build:
		docker-compose --project-directory docker -p $(PROJECT) up -d --build

bash:
		docker-compose --project-directory docker -p $(PROJECT) exec web bash


dev: dev-up-build bash


logs-web:
		docker-compose --project-directory docker -p $(PROJECT) logs --follow --tail 100 web

test:
		docker-compose --project-directory docker -p $(PROJECT) exec web rspec

stats:
		docker-compose --project-directory docker -p $(PROJECT) exec web rspec && open coverage/index.html	# only for MacOS; if Debian/Linux 'xdg-open coverage/index.html';

ci:
		docker-compose --project-directory docker -p $(PROJECT) exec web bash -c "rubocop; rspec; rake rswag"

down:
	docker-compose \
		--project-directory docker \
		-p $(PROJECT) \
		down \
		--remove-orphans
