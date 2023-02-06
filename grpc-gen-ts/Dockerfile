FROM node:19

LABEL vendor="digi-lab.io"
LABEL org.opencontainers.image.source=https://github.com/digi-lab-io/digi-lab-io-grpc-build-images

WORKDIR /digi-lab-io/grpc-gen-ts

ARG pb_version
ARG ts_proto_version
ARG download_cmd="curl -LO https://github.com/google/protobuf/releases/download/v${pb_version}/protoc-${pb_version}-linux-x86_64.zip"
ARG unzip_cmd="unzip protoc-${pb_version}-linux-x86_64.zip -d /root/.local"

RUN $download_cmd
RUN $unzip_cmd

ENV PATH="$PATH:/root/.local/bin"

RUN npm install -g ts-proto@${ts_proto_version}
CMD ["/usr/bin/protoc", "--help"]

