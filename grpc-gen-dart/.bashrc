PROTOBUF_VERSION=$(grep 'protobuf_version:' version.yaml | awk '{print $2}')
GRPC_GEN_VERSION=$(grep 'grpc_gen_version:' version.yaml | awk '{print $2}')
VERSION="${PROTOBUF_VERSION}-${GRPC_GEN_VERSION}"

unalias grpc-gen-dart &> /dev/null
grpc-gen-dart() {
    # docker or nerdctl check
    CCMD=$(command -v nerdctl 2> /dev/null)
    if [ -z "$CCMD" ]; then
      CCMD=$(command -v docker 2> /dev/null)
    fi
    # function
    $CCMD run --rm -v $(pwd):/digi-lab-io/grpc-gen-dart ghcr.io/digi-lab-io/digi-lab-io-grpc-gen-dart:$VERSION protoc "$@"
}
