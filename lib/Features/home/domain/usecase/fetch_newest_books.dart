import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';
import '../repo/home_repo.dart';
import 'fetch_featured_books.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepos homeRepos;
  FetchNewestBooksUseCase(this.homeRepos);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepos.fetchNewestBooks();
  }
}
