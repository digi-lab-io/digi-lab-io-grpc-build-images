import { Controller } from '@nestjs/common';
import {
	Book,
	BookId,
	BookMethodsController,
	BookMethodsControllerMethods,
	Books,
	Empty,
} from './generated/book';
import { Metadata } from '@grpc/grpc-js';
import { from, Observable } from 'rxjs';

@Controller()
@BookMethodsControllerMethods()
export class AppController implements BookMethodsController {
	private bookShelf: Books = {
		books: [
			{ id: 1, title: 'AAA' },
			{ id: 2, title: 'BBB' },
		],
	};

	createBook(request: Book, metadata?: Metadata): Observable<Book> {
		const book = { id: request.id, title: request.title };
		this.bookShelf.books.push(book);
		return from([book]);
	}

	deleteBook(request: BookId, metadata?: Metadata): Observable<Empty> {
		this.bookShelf.books = this.bookShelf.books.filter(
			(book) => book.id !== request.id,
		);
		return from([{}]);
	}

	editBook(request: Book, metadata?: Metadata): Observable<Book> {
		this.bookShelf.books = this.bookShelf.books.map((book) =>
			book.id === request.id ? request : book,
		);
		return from([request]);
	}

	getAllBooks(request: Empty, metadata?: Metadata): Observable<Books> {
		return from([this.bookShelf]);
	}

	getBook(request: BookId, metadata?: Metadata): Observable<Book> {
		return from([
			this.bookShelf.books.find((book) => book.id === request.id)!,
		]);
	}
}
