FROM --platform=$BUILDPLATFORM google/dart:2.15.1

LABEL vendor="digi-lab.io"
LABEL org.opencontainers.image.source=https://github.com/digi-lab-io/digi-lab-io-grpc-build-images

WORKDIR /digi-lab-io/grpc-gen-dart

ARG pb_version
ARG download_cmd="curl -LO https://github.com/google/protobuf/releases/download/v${pb_version}/protoc-${pb_version}-linux-x86_64.zip"
ARG unzip_cmd="unzip protoc-${pb_version}-linux-x86_64.zip -d /root/.local"

RUN apt-get update || true
RUN apt-get install unzip -y

RUN $download_cmd
RUN $unzip_cmd

ENV PATH="$PATH:/root/.local/bin"
ENV PATH="$PATH:~/.pub-cache/bin"

RUN dart pub global activate protoc_plugin

CMD ["/usr/bin/protoc", "--help"]
