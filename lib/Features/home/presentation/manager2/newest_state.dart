part of 'newest_cubit.dart';

@immutable
abstract class NewestState {}

class NewestInitial extends NewestState {}

class NewestBooksLoading extends NewestState {}

class NewestBooksSuccess extends NewestState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestState {
  final String errorMessage;

  NewestBooksFailure(this.errorMessage);
}
