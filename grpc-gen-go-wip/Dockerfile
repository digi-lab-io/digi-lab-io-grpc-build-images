ARG go_version

FROM golang:${go_version}-buster

ARG pb_version
ARG grpc_version
ARG gen_version
ARG compile_daemon_version
ARG dlv_version

RUN apt-get update && apt-get install -y build-essential curl git wget unzip && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v${pb_version}/protobuf-cpp-${pb_version}.zip && \
        unzip protobuf-cpp-${pb_version}.zip && \
        cd protobuf-${pb_version} && \
        ./configure  && \
        make  && \
        make check  && \
        make install  && \
        ldconfig && \
        cd ../ && \
        rm -rf protobuf-*

WORKDIR /tmp

RUN GO111MODULE=on go get google.golang.org/protobuf/cmd/protoc-gen-go@v${gen_version} && \
        GO111MODULE=on go get google.golang.org/grpc@v${grpc_version} && \
        GO111MODULE=on go get github.com/githubnemo/CompileDaemon@v${compile_daemon_version} && \
        GO111MODULE=on go get github.com/go-delve/delve/cmd/dlv@v${dlv_version}


RUN git clone https://github.com/grpc/grpc-go.git && \
        cd grpc-go/cmd/protoc-gen-go-grpc && \
        git checkout v${grpc_version} && go install . && \
        cd /tmp && rm -rf grpc-go

WORKDIR /go