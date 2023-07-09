import 'package:apps_flutter/core/errors/errors.dart';
import 'package:apps_flutter/core/utils/api_service.dart';
import 'package:apps_flutter/features/home/data/model/BookModel.dart';
import 'package:apps_flutter/features/home/data/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImplement implements HomeRepository {

  ApiService apiService;

  HomeRepositoryImplement(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedNewestBooks() async {

    try{
      var data = await apiService.getData(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest &q=programming');

      List<BookModel> bookList = [];
      for(var item in data['items']){
        try{
          bookList.add(BookModel.fromJson(item));
        }catch(e){
          print(item);
        }
      }
      return right(bookList);

    } catch(e){
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    try{
      var data = await apiService.getData(
          endPoint:
          'volumes?Filtering=free-ebooks&q=subject:programming');

      List<BookModel> bookList = [];
      for(var item in data['items']){
        bookList.add(BookModel.fromJson(item));
      }
      return right(bookList);

    } catch(e){
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{

    try{
      var data = await apiService.getData(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:programming');

      List<BookModel> bookList = [];
      for(var item in data['items']){
        bookList.add(BookModel.fromJson(item));
      }
      return right(bookList);

    } catch(e){
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String text}) async{

    try{
      var data = await apiService.getData(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$text',query:{
            'q' : 'subject:$text',
      } );

      List<BookModel> bookList = [];
      for(var item in data['items']){
        bookList.add(BookModel.fromJson(item));
      }
      return right(bookList);

    } catch(e){
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
