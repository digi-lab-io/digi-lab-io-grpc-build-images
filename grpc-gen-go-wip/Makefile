GO_VERSION=1.15
PROTOBUF_VERSION=3.13.0
GEN_VERSION=1.25.0
GRPC_VERSION=1.33.1
COMPILE_DAEMON_VERSION=1.2.1
DLV_VERSION=1.5.0
IMAGE_TAG=xxx/entities-contracts/grpc-gen-go-$(PROTOBUF_VERSION):latest

help:
	@echo "Makefile commands:"
	@echo "build"
	@echo "push"
	@echo "all"

push:
	@nerdctl push ${IMAGE_TAG}

build:
	@nerdctl build --no-cache \
        --build-arg pb_version=$(PROTOBUF_VERSION) \
        --build-arg go_version=$(GO_VERSION) \
        --build-arg gen_version=$(GEN_VERSION) \
        --build-arg grpc_version=$(GRPC_VERSION) \
        --build-arg compile_daemon_version=$(COMPILE_DAEMON_VERSION) \
        --build-arg dlv_version=$(DLV_VERSION) \
    -t $(IMAGE_TAG) .

history:
	@nerdctl image history $(IMAGE_TAG)

sh:
	@nerdctl run --rm --interactive --tty --entrypoint /bin/sh $(IMAGE_TAG)
