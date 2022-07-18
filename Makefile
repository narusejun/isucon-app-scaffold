HOSTNAME:=$(shell hostname)
BRANCH:=master

all: build

.PHONY: deploy
deploy: checkout start

.PHONY: checkout
checkout:
	git fetch && \
	git reset --hard origin/$(BRANCH)

.PHONY: start
start:
	cd $(HOSTNAME) && ./deploy.sh
