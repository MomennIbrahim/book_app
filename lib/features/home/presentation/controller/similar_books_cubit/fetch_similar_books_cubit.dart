import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/model/BookModel.dart';
import '../../../data/repository/home_repository.dart';
part 'fetch_similar_books_state.dart';

class FetchSimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  FetchSimilarBooksCubit(this.homeRepository) : super(FetchSimilarInitial());

  final HomeRepository homeRepository;

  Future<void> getFeaturedBooks({required String category}) async {
    emit(FetchSimilarLoading());

    var result = await homeRepository.fetchSimilarBooks(category: category);

    result.fold((failure) {
      emit(FetchSimilarFailure(failure.errMessage));
    }, (books){
      emit(FetchSimilarSuccess(books));
    });
  }
}
