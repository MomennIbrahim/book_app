import 'package:apps_flutter/features/home/data/repository/home_repository.dart';
import 'package:apps_flutter/features/search/controller/search_state.dart';
import 'package:bloc/bloc.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepository) : super(SearchInitialState());

  HomeRepository homeRepository;

  Future<void> fetchSearchData({required String text})async{

    emit(SearchLoadingState());

   var result = await homeRepository.fetchSearchBooks(text: text);

   result.fold((failure) {
     emit(SearchFailureState(failure.errMessage));
   }, (books) {
     emit(SearchSuccessState(books));
   });
  }

}
