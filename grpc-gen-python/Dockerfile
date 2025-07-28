FROM python:3.13-slim

LABEL vendor="digi-lab.io"
LABEL org.opencontainers.image.source=https://github.com/digi-lab-io/digi-lab-io-grpc-build-images

WORKDIR /digi-lab-io/grpc-gen-python

ARG python_pypi_grpcio_version

# Install necessary build tools
RUN apt-get update && apt-get install -y build-essential

RUN python -m pip install --upgrade pip protobuf
RUN python -m pip install grpcio==${python_pypi_grpcio_version} grpcio-tools==${python_pypi_grpcio_version}

RUN python --version

CMD ["/usr/bin/python"]
