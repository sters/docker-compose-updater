
COMPOSE=docker-compose
RELEASE_URL=https://github.com/docker/compose/releases/latest
DOWNLOAD_URL=https://github.com/docker/compose/releases/download


.PHONY: update

default: update


VERSION := $(shell curl -s -I $(RELEASE_URL) | grep Location | cut -d / -f8)
INSTALL_PATH := $(shell which $(COMPOSE) 2> /dev/null)

ifndef INSTALL_PATH
$(error COMPOSE not found)
endif

OS := $(shell uname -s)
ARCH := $(shell uname -m)

update:
	@echo "Now version: $(shell $(INSTALL_PATH) -v)"
	@echo "Start Download: $(VERSION)"
	@echo ""

	@curl -L $(DOWNLOAD_URL)/$(VERSION)/docker-compose-$(OS)-$(ARCH) -o $(INSTALL_PATH)
	@chmod +x $(INSTALL_PATH)
	
	@echo ""
	@echo "Update done: $(VERSION)"
