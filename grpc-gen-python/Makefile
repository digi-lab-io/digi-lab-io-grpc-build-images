#!make
SHELL=/bin/bash
.ONESHELL:

PYTHON_PYPI_GRPCIO_VERSION := $(shell grep 'python_pypi_grpcio_version:' version.yaml | awk '{print $$2}')
GRPC_GEN_VERSION := $(shell grep 'grpc_gen_version:' version.yaml | awk '{print $$2}')

IMAGE_TAG_LATEST=ghcr.io/digi-lab-io/digi-lab-io-grpc-gen-python:latest
IMAGE_TAG_SEMVER=ghcr.io/digi-lab-io/digi-lab-io-grpc-gen-python:$(PYTHON_PYPI_GRPCIO_VERSION)-$(GRPC_GEN_VERSION)

CCMD = $(shell command -v nerdctl 2> /dev/null)

ifeq (,$(findstring nerdctl,$(CCMD)))
	CCMD = $(shell command -v docker 2> /dev/null)
endif

build:
	@${CCMD} build --no-cache --build-arg python_pypi_grpcio_version=$(PYTHON_PYPI_GRPCIO_VERSION) -t $(IMAGE_TAG_SEMVER) .

push:
	@${CCMD} tag ${IMAGE_TAG_SEMVER} ${IMAGE_TAG_LATEST}
	@${CCMD} push ${IMAGE_TAG_SEMVER}
	@echo "Pushed ${IMAGE_TAG_SEMVER}"
	@${CCMD} push ${IMAGE_TAG_LATEST}
	@echo "Pushed ${IMAGE_TAG_LATEST}"

generate-example:
	@source .bashrc && \
	mkdir -p ./example/python/src/generated/ && rm -rf ./example/python/src/generated/* && \
    grpc-gen-python -I=example/proto \
    	--python_out=./example/python/src/generated/ \
    	--pyi_out=./example/python/src/generated/ \
    	--grpc_python_out=./example/python/src/generated/ example/proto/*.proto \
    	google/protobuf/timestamp.proto

bump-patch:
	@echo "Bumping patch version from $(GRPC_GEN_VERSION) to $$(echo $(GRPC_GEN_VERSION) | awk -F. '{$$NF=$$NF+1;} 1' OFS=.)"
	@sed -i "" "s/grpc_gen_version: $(GRPC_GEN_VERSION)/grpc_gen_version: $$(echo $(GRPC_GEN_VERSION) | awk -F. '{$$NF=$$NF+1;} 1' OFS=.)/g" version.yaml

bump-minor:
	@echo "Bumping minor version from $(GRPC_GEN_VERSION) to $$(echo $(GRPC_GEN_VERSION) | awk -F. '{$$NF=$$NF+1;} 1' OFS=.)"
	@sed -i "" "s/grpc_gen_version: $(GRPC_GEN_VERSION)/grpc_gen_version: $$(echo $(GRPC_GEN_VERSION) | awk -F. '{$$NF=$$NF+1;} 1' OFS=.)/g" version.yaml

bump-major:
	@echo "Bumping major version from $(GRPC_GEN_VERSION) to $$(echo $(GRPC_GEN_VERSION) | awk -F. '{$$1=$$1+1; $$2=0; $$3=0;} 1' OFS=.)"
	@sed -i "" "s/grpc_gen_version: $(GRPC_GEN_VERSION)/grpc_gen_version: $$(echo $(GRPC_GEN_VERSION) | awk -F. '{$$1=$$1+1; $$2=0; $$3=0;} 1' OFS=.)/g" version.yaml
