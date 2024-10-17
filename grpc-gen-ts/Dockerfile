FROM node:22 AS builder

ARG protobuf_version
ARG download_cmd="curl -LO https://github.com/google/protobuf/releases/download/v${protobuf_version}/protoc-${protobuf_version}-linux-x86_64.zip"
ARG unzip_cmd="unzip protoc-${protobuf_version}-linux-x86_64.zip -d /root/.local"

WORKDIR /digi-lab-io/grpc-gen-ts

RUN $download_cmd
RUN $unzip_cmd

# Second stage: Install ts-proto and set up the final environment
FROM alpine:3.18

LABEL vendor="digi-lab.io"
LABEL org.opencontainers.image.source=https://github.com/digi-lab-io/digi-lab-io-grpc-build-images

WORKDIR /digi-lab-io/grpc-gen-ts

ARG ts_proto_version

# Install necessary dependencies
RUN apk add --no-cache nodejs npm

COPY --from=builder /root/.local /usr/local
COPY --from=builder /root/.local /root/.local

ENV PATH="$PATH:/usr/local/bin"

RUN npm install -g ts-proto@${ts_proto_version}

ENTRYPOINT ["protoc"]
CMD []
