///
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'book.pb.dart' as $0;
export 'book.pb.dart';

class BookMethodsClient extends $grpc.Client {
  static final _$createBook = $grpc.ClientMethod<$0.Book, $0.Book>(
      '/book.BookMethods/CreateBook',
      ($0.Book value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Book.fromBuffer(value));
  static final _$getAllBooks = $grpc.ClientMethod<$0.Empty, $0.Books>(
      '/book.BookMethods/GetAllBooks',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Books.fromBuffer(value));
  static final _$getBook = $grpc.ClientMethod<$0.BookId, $0.Book>(
      '/book.BookMethods/GetBook',
      ($0.BookId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Book.fromBuffer(value));
  static final _$deleteBook = $grpc.ClientMethod<$0.BookId, $0.Empty>(
      '/book.BookMethods/DeleteBook',
      ($0.BookId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$editBook = $grpc.ClientMethod<$0.Book, $0.Book>(
      '/book.BookMethods/EditBook',
      ($0.Book value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Book.fromBuffer(value));

  BookMethodsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Book> createBook($0.Book request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBook, request, options: options);
  }

  $grpc.ResponseFuture<$0.Books> getAllBooks($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllBooks, request, options: options);
  }

  $grpc.ResponseFuture<$0.Book> getBook($0.BookId request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBook, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteBook($0.BookId request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteBook, request, options: options);
  }

  $grpc.ResponseFuture<$0.Book> editBook($0.Book request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editBook, request, options: options);
  }
}

abstract class BookMethodsServiceBase extends $grpc.Service {
  $core.String get $name => 'book.BookMethods';

  BookMethodsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Book, $0.Book>(
        'CreateBook',
        createBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Book.fromBuffer(value),
        ($0.Book value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Books>(
        'GetAllBooks',
        getAllBooks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Books value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BookId, $0.Book>(
        'GetBook',
        getBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BookId.fromBuffer(value),
        ($0.Book value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BookId, $0.Empty>(
        'DeleteBook',
        deleteBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BookId.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Book, $0.Book>(
        'EditBook',
        editBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Book.fromBuffer(value),
        ($0.Book value) => value.writeToBuffer()));
  }

  $async.Future<$0.Book> createBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Book> request) async {
    return createBook(call, await request);
  }

  $async.Future<$0.Books> getAllBooks_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAllBooks(call, await request);
  }

  $async.Future<$0.Book> getBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.BookId> request) async {
    return getBook(call, await request);
  }

  $async.Future<$0.Empty> deleteBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.BookId> request) async {
    return deleteBook(call, await request);
  }

  $async.Future<$0.Book> editBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Book> request) async {
    return editBook(call, await request);
  }

  $async.Future<$0.Book> createBook($grpc.ServiceCall call, $0.Book request);
  $async.Future<$0.Books> getAllBooks($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Book> getBook($grpc.ServiceCall call, $0.BookId request);
  $async.Future<$0.Empty> deleteBook($grpc.ServiceCall call, $0.BookId request);
  $async.Future<$0.Book> editBook($grpc.ServiceCall call, $0.Book request);
}
