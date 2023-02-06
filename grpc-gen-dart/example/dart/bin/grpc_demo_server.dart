import 'package:grpc/grpc.dart';
import '../lib/generated/book.pbgrpc.dart';

class BookMethodsService extends BookMethodsServiceBase {
  Books books = Books();

  @override
  Future<Book> createBook(ServiceCall call, Book request) async {
    var book = Book();
    book.title = request.title;
    book.id = request.id;
    books.books.add(book);
    return book;
  }

  @override
  Future<Books> getAllBooks(ServiceCall call, Empty request) async {
    return books;
  }

  @override
  Future<Book> getBook(ServiceCall call, BookId request) async {
    var book = books.books.firstWhere((book) => book.id == request.id);
    return book;
  }

  @override
  Future<Empty> deleteBook(ServiceCall call, BookId request) async {
    books.books.removeWhere((book) => book.id == request.id);
    return Empty();
  }

  @override
  Future<Book> editBook(ServiceCall call, Book request) async {
    var book = books.books.firstWhere((book) => book.id == request.id);
    book.title = request.title;
    return book;
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [BookMethodsService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}
