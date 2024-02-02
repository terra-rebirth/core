all: opzd-env opzd-upgrade-env

opzd-env:
	docker build --platform linux/amd64 --no-cache --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) --tag terrarebirth/opzd-env opzd-env

opzd-upgrade-env:
	docker build --platform linux/amd64 --no-cache --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) --build-arg entrypoint=cosmovisor-entrypoint.sh --tag terrarebirth/opzd-upgrade-env opzd-env

.PHONY: all opzd-env opzd-upgrade-env
