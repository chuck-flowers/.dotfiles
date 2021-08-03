type docker > /dev/null 2>&1 && docker-tmp() {
	docker run -it --rm --mount type=bind,src=$(pwd),dst=/workspace --user "$(id -u):$(id -g)" $@
}

