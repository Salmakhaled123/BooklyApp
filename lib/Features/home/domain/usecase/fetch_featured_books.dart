import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repo/home_repo.dart';
import 'package:booklyapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepos homeRepos;
  FetchFeaturedBooksUseCase(this.homeRepos);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepos.fetchFeaturedBooks();
  }
}

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}
