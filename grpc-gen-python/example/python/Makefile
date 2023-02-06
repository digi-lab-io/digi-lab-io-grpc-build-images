#!make
SHELL := /bin/bash

.ONESHELL:
.PHONY:

PY_VERSION=3.11
PROJECT_NAME=grpc-gen-python

local-env: local-env-install-python local-env-install-python-deps


load-pyenv: 
	@eval "$$(pyenv init -)" && pyenv activate ${PROJECT_NAME}

local-dev-python-env-install-venv: local-dev-python-env-uninstall
	@echo "Creating a new python environment for the project ${PROJECT_NAME} with the python version: ${PY_VERSION} ..."
	@pyenv install -s ${PY_VERSION}
	@pyenv virtualenv -f ${PY_VERSION} ${PROJECT_NAME}
	@rm -f .python-version || true && echo ${PROJECT_NAME} >> .python-version
	@$(MAKE) local-dev-python-env-install-deps

local-dev-python-env-install-deps:
	@echo "Installing deps"
	@poetry install

local-dev-python-env-uninstall:
	@echo "Uninstalling project pyenv and virtual-env"
	@pyenv uninstall -f ${PROJECT_NAME} || true
	@pyenv virtualenv-delete -f ${PROJECT_NAME}
	@rm -rf $$(echo eval ~/.pyenv/versions/${PY_VERSION}/envs/${PROJECT_NAME})
