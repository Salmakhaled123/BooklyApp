part of 'featured_cubit.dart';

@immutable
abstract class FeaturedState {}

class FeaturedInitial extends FeaturedState {}

class FeaturedLoading extends FeaturedState {}

class FeaturedSuccess extends FeaturedState {
  final List<BookEntity> books;

  FeaturedSuccess(this.books);
}

class FeaturedFailure extends FeaturedState {
  final String errorMessage;

  FeaturedFailure(this.errorMessage);
}
