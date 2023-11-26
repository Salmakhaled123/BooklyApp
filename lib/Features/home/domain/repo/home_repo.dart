import 'package:booklyapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/book_entity.dart';

abstract class HomeRepos {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
