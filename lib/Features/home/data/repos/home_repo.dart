import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:booklyapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
  Future<Either<Failure, List<BookModel>>> fetchSearchResults(
      {required String text});
}
