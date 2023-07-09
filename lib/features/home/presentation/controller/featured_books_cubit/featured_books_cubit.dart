import 'package:apps_flutter/features/home/data/repository/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepository) : super(FeaturedBooksInitial());

  final HomeRepository homeRepository;

  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await homeRepository.fetchFeaturedBooks();

    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books){
      emit(FeaturedBooksSuccess(books));
    });
  }
}
