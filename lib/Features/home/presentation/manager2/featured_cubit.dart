import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/domain/usecase/fetch_featured_books.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/book_entity.dart';

part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  FeaturedCubit(this.featuredBooksUseCase) : super(FeaturedInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeatured() async {
    emit(FeaturedLoading());
    var result = await featuredBooksUseCase.call();
    result.fold((failure) {
      emit(FeaturedFailure(failure.errorMessage));
    }, (books) {
      emit(FeaturedSuccess(books));
    });
  }
}
