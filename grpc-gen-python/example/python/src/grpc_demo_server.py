import asyncio
import logging
import grpc
import sys

sys.path.append('./generated')
from generated import book_pb2_grpc, book_pb2

books_list = []


class BookMethodsService(book_pb2_grpc.BookMethodsServicer):
    async def CreateBook(self, request: book_pb2.Book, context: grpc.aio.ServicerContext) -> book_pb2.Book:
        book = book_pb2.Book()
        book.id = request.id
        book.title = request.title
        books_list.append(book)
        return book_pb2.Book(**{'id': book.id, 'title': book.title})

    async def GetAllBooks(self, request: book_pb2.Empty, context: grpc.aio.ServicerContext) -> book_pb2.Book:
        return book_pb2.Books(books=books_list)


async def serve() -> None:
    server = grpc.aio.server()
    book_pb2_grpc.add_BookMethodsServicer_to_server(BookMethodsService(), server)
    listen_addr = '[::]:50051'
    server.add_insecure_port(listen_addr)
    logging.info("Starting server on %s", listen_addr)
    await server.start()
    await server.wait_for_termination()
    server.add_insecure_port('[::]:50051')


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    asyncio.run(serve())
