part of 'fetch_similar_books_cubit.dart';

@immutable
abstract class FetchSimilarBooksState {}

class FetchSimilarInitial extends FetchSimilarBooksState {}

class FetchSimilarLoading extends FetchSimilarBooksState {}

class FetchSimilarSuccess extends FetchSimilarBooksState {
  final List<BookModel>? bookModel;

  FetchSimilarSuccess(this.bookModel);
}

class FetchSimilarFailure extends FetchSimilarBooksState {
  final String failure;

  FetchSimilarFailure(this.failure);
}
