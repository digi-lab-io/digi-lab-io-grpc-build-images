/* eslint-disable */
import { Metadata } from "@grpc/grpc-js";
import { GrpcMethod, GrpcStreamMethod } from "@nestjs/microservices";
import { Observable } from "rxjs";

export const protobufPackage = "book";

export interface Empty {
}

export interface BookId {
  id: number;
}

export interface Book {
  id: number;
  title: string;
}

export interface Books {
  books: Book[];
}

export const BOOK_PACKAGE_NAME = "book";

export interface BookMethodsClient {
  createBook(request: Book, metadata: Metadata, ...rest: any): Observable<Book>;

  getAllBooks(request: Empty, metadata: Metadata, ...rest: any): Observable<Books>;

  getBook(request: BookId, metadata: Metadata, ...rest: any): Observable<Book>;

  deleteBook(request: BookId, metadata: Metadata, ...rest: any): Observable<Empty>;

  editBook(request: Book, metadata: Metadata, ...rest: any): Observable<Book>;
}

export interface BookMethodsController {
  createBook(request: Book, metadata: Metadata, ...rest: any): Observable<Book>;

  getAllBooks(request: Empty, metadata: Metadata, ...rest: any): Observable<Books>;

  getBook(request: BookId, metadata: Metadata, ...rest: any): Observable<Book>;

  deleteBook(request: BookId, metadata: Metadata, ...rest: any): Observable<Empty>;

  editBook(request: Book, metadata: Metadata, ...rest: any): Observable<Book>;
}

export function BookMethodsControllerMethods() {
  return function (constructor: Function) {
    const grpcMethods: string[] = ["createBook", "getAllBooks", "getBook", "deleteBook", "editBook"];
    for (const method of grpcMethods) {
      const descriptor: any = Reflect.getOwnPropertyDescriptor(constructor.prototype, method);
      GrpcMethod("BookMethods", method)(constructor.prototype[method], method, descriptor);
    }
    const grpcStreamMethods: string[] = [];
    for (const method of grpcStreamMethods) {
      const descriptor: any = Reflect.getOwnPropertyDescriptor(constructor.prototype, method);
      GrpcStreamMethod("BookMethods", method)(constructor.prototype[method], method, descriptor);
    }
  };
}

export const BOOK_METHODS_SERVICE_NAME = "BookMethods";
