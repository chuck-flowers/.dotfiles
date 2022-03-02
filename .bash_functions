#!/usr/bin/bash

if command -v docker > /dev/null 2>&1; then
	docker-tmp() {
		docker run -it --rm --mount type=bind,src=$(pwd),dst=/workspace --user "$(id -u):$(id -g)" $@
	}
fi

if command -v docker-compose > /dev/null 2>&1; then
	docker-compose-bounce() {
		docker-compose down && docker-compose up -d --build
	}
fi

