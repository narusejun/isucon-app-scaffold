HOSTNAME:=$(shell hostname)
BRANCH:=master

.PHONY: deploy
deploy: checkout start

.PHONY: checkout
checkout:
	git fetch && \
	git switch -C $(BRANCH) origin/$(BRANCH) && \
	git reset --hard origin/$(BRANCH)

.PHONY: start
start:
	cd $(HOSTNAME) && ./deploy.sh
