# digi-lab.io | grpc-gen-dart

A bash target to generate Dart code from gRPC protobuf files for the example directory.

## Usage

There is a bash target to generate a dart code from gRPC protobuf files for a dart example project.

```bash
make generate-example
```

The target `generate-example` performs the following steps:

1. Sources the `.bashrc` file to make sure the `grpc-gen-dart` function is available.
2. Creates the directory `./example/dart/lib/generated/` if it doesn't exist.
3. Deletes all files in `./example/dart/lib/generated/`.
4. Calls the `grpc-gen-dart` function with the following parameters:
    - `-I=./example/proto`: include the `./example/proto` directory in the search path for protobuf files.
    - `example/proto/*.proto`: generate Dart code from all `.proto` files in the `./example/proto` directory.
    - `--dart_out="grpc,generate_kythe_info:./example/dart/lib/generated/"`: generate Dart gRPC client code and Kythe info in the `./example/dart/lib/generated/` directory.
    - `google/protobuf/timestamp.proto`: generate Dart code for the `google/protobuf/timestamp.proto` file.
