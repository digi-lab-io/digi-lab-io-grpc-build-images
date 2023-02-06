# digi-lab.io | grpc-gen-python

A bash target to generate python code from gRPC protobuf files for the example directory.

## Usage

Note
The 2 in pb2 indicates that the generated code is following Protocol Buffers Python API version 2. Version 1 is obsolete. It has no relation to the Protocol Buffers Language version, which is the one indicated by syntax = "proto3" or syntax = "proto2" in a .proto file.
-- source: https://grpc.io/docs/languages/python/basics/

There is a bash target to generate a python code from gRPC protobuf files for a python example project.

```bash
make generate-example
```

The target `generate-example` performs the following steps:

1. Sources the `.bashrc` file to make sure the `grpc-gen-python` function is available.
2. Creates the directory `./example/python/src/generated` if it doesn't exist.
3. Deletes all files in `./example/python/src/generated`.
4. Calls the `grpc-gen-python` function with the following parameters:
    - `-I=example/proto`: include the `example/proto` directory in the search path for protobuf files.
    - `example/proto/*.proto`: generate python code from all `.proto` files in the `./example/proto` directory.
    - `--dart_out="grpc:./example/python/src/generated"`: generate python gRPC client code in the `./example/python/src/generated` directory.
    - `google/protobuf/timestamp.proto`: generate python code for the `google/protobuf/timestamp.proto` file.
