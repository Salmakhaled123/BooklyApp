import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/domain/usecase/fetch_newest_books.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/book_entity.dart';

part 'newest_state.dart';

class NewestCubit extends Cubit<NewestState> {
  NewestCubit(this.fetchNewestBooksUseCase) : super(NewestInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewest() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errorMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
