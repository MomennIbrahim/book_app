import '../../home/data/model/BookModel.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}
class SearchSuccessState extends SearchState {
  final List<BookModel> bookModel;

  SearchSuccessState(this.bookModel);
}
class SearchFailureState extends SearchState {
  final String errMessage;

  SearchFailureState(this.errMessage);
}
