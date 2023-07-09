import 'package:apps_flutter/features/home/data/model/BookModel.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';

abstract class HomeRepository{

  Future<Either<Failure,List<BookModel>>> fetchFeaturedNewestBooks();
  Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>> fetchSimilarBooks({required String category});
  Future<Either<Failure,List<BookModel>>> fetchSearchBooks({required String text});

}