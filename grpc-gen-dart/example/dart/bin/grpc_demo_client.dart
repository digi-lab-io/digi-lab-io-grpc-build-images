import 'package:grpc/grpc.dart';
import '../lib/generated/book.pbgrpc.dart';

main() {
  var client = Client();
  client.main([]);
}

class Client {
  late ClientChannel channel;
  late BookMethodsClient stub;

  Future<void> main(List<String> args) async {
    channel = ClientChannel('localhost',
        port: 50051,
        options: // No credentials in this example
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = BookMethodsClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    try {
      //...
      var bookToAdd1 = Book();
      bookToAdd1.id = 1;
      bookToAdd1.title = "Things Fall Apart";
      var addedBook1 = await stub.createBook(bookToAdd1);
      print("Added a book: $addedBook1");

      var bookToAdd2 = Book();
      bookToAdd2.id = 2;
      bookToAdd2.title = "No Longer at Ease";
      var addedBook2 = await stub.createBook(bookToAdd2);
      print("Added a book: $addedBook2");

      var allBooks = await stub.getAllBooks(Empty());
      print("allBooks ${allBooks.books}");

      var bookToDel = BookId();
      bookToDel.id = 2;
      await stub.deleteBook(bookToDel);
      print("Deleted Book with ID: ${2}");

      var allBooks2 = await stub.getAllBooks(Empty());
      print("allBooks2 ${allBooks2.books}");

      var bookToEdit = Book();
      bookToEdit.id = 1;
      bookToEdit.title = "Beware Soul Brother";
      await stub.editBook(bookToEdit);

      var bookToGet = BookId();
      bookToGet.id = 1;
      var bookGotten = await stub.getBook(bookToGet);
      print("Book Id 1 gotten: $bookGotten");
    } catch (e) {
      print(e);
    }
    await channel.shutdown();
  }
}


