import grpc
import sys

sys.path.append('./generated')
from generated import book_pb2_grpc, book_pb2


class BooksClient(object):
    """
    Client for gRPC functionality
    """

    def __init__(self):
        self.host = 'localhost'
        self.server_port = 50051

        # instantiate a channel
        self.channel = grpc.insecure_channel(
            '{}:{}'.format(self.host, self.server_port))

        # bind the client and the server
        self.stub = book_pb2_grpc.BookMethodsStub(self.channel)

    def GetAllBooks(self, request: book_pb2.Empty):
        """
        Client function to call the rpc for GetServerResponse
        """
        return self.stub.GetAllBooks(book_pb2.Empty())


if __name__ == '__main__':
    client = BooksClient()
    result = client.GetAllBooks(book_pb2.Empty())
    print(f'{result}')
