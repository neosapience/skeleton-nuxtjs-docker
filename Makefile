name := skeleton-nuxtjs
pwd := $(shell pwd)
tag := v0.0.1

init:
	@docker build . -t ${name}:dev -f Dockerfile.init
	@docker run --rm -it \
		-v ${pwd}/src:/opt/webapp \
		${name}:dev \
		yarn create nuxt-app app
 	
	@mv src/app/* src/
    @mv src/app/.* src/
	@rmdir src/app

build:
	@docker build . -t ${name}:dev

dist:
	@docker build . -t ${name}:${tag}

push:
	@docker push ${name}:${tag}

install:
	@docker run --rm -it -v ${pwd}/src:/opt/webapp ${name}:dev yarn install

up:
	@docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d

up-live:
	@docker-compose -f docker-compose.yml up -d

down:
	@docker-compose down

ps:
	@docker-compose ps

logs:
	@docker-compose logs -f

ls:
	@docker images ${name}

run:
	@docker run --rm -it -p 3000 \
		-e HOST=0.0.0.0 \
		-v ${pwd}/src:/opt/webapp \
		${name}:dev

sh:
	@docker run --rm -it -p 3000 \
		-e HOST=0.0.0.0 \
		-v ${pwd}/src:/opt/webapp \
		${name}:dev sh

