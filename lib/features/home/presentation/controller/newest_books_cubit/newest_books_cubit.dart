import 'package:apps_flutter/features/home/data/repository/home_repository.dart';
import 'package:bloc/bloc.dart';

import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepository) : super(NewestBooksInitial());

  final HomeRepository homeRepository;

  Future<void> getFeaturedNewestBooks()async{

    emit(NewestBooksLoading());
    var result = await homeRepository.fetchFeaturedNewestBooks();

    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books){
      emit(NewestBooksSuccess(books));
    });
  }
}
