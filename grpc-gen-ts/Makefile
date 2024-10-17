#!make
SHELL=/bin/bash
.ONESHELL:

PROTOBUF_VERSION := $(shell grep 'protobuf_version:' version.yaml | awk '{print $$2}')
TS_PROTO_VERSION := $(shell grep 'ts_proto_version:' version.yaml | awk '{print $$2}')
GRPC_GEN_VERSION := $(shell grep 'grpc_gen_version:' version.yaml | awk '{print $$2}')

IMAGE_TAG_LATEST=ghcr.io/digi-lab-io/digi-lab-io-grpc-gen-ts:latest
IMAGE_TAG_SEMVER=ghcr.io/digi-lab-io/digi-lab-io-grpc-gen-ts:$(PROTOBUF_VERSION)-$(TS_PROTO_VERSION)-$(GRPC_GEN_VERSION)

CCMD = $(shell command -v nerdctl 2> /dev/null)

ifeq (,$(findstring nerdctl,$(CCMD)))
	CCMD = $(shell command -v docker 2> /dev/null)
endif

echo:
	@echo "PROTOBUF_VERSION: $(PROTOBUF_VERSION)"
	@echo "TS_PROTO_VERSION: $(TS_PROTO_VERSION)"
	@echo "GRPC_GEN_VERSION: $(GRPC_GEN_VERSION)"
	@echo "IMAGE_TAG_LATEST: $(IMAGE_TAG_LATEST)"
	@echo "IMAGE_TAG_SEMVER: $(IMAGE_TAG_SEMVER)"

build:
	@${CCMD} build --no-cache --build-arg protobuf_version=$(PROTOBUF_VERSION) --build-arg ts_proto_version=$(TS_PROTO_VERSION) -t $(IMAGE_TAG_SEMVER) .

push:
	@${CCMD} tag ${IMAGE_TAG_SEMVER} ${IMAGE_TAG_LATEST}
	@${CCMD} push ${IMAGE_TAG_SEMVER}
	@echo "Pushed ${IMAGE_TAG_SEMVER}"
	@${CCMD} push ${IMAGE_TAG_LATEST}
	@echo "Pushed ${IMAGE_TAG_LATEST}"

# protoc --plugin=./node_modules/.bin/protoc-gen-ts_proto --ts_proto_out=. ./simple.proto
generate-example:
	@source .bashrc && \
	mkdir -p ./example/ts/src/generated/ && rm -rf ./example/ts/src/generated/* && \
    grpc-gen-ts -I=example/proto \
    	--ts_proto_opt=addGrpcMetadata=true \
    	--ts_proto_opt=returnObservable=true \
    	--ts_proto_opt=nestJs=true \
    	--ts_proto_out=./example/ts/src/generated/ \
    	--ts_proto_opt=addNestjsRestParameter=true \
    	example/proto/*.proto \
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
