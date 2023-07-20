import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../home/data/models/BookModel.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final HomeRepo homeRepo;
  Future<void>fetchSearchResults(String text)async
  {
    emit(SearchLoading());
    var results=await homeRepo.fetchSearchResults(text: text);
    results.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
    },
            (books)
        {
          if(text.isEmpty)
            {
              books=[];
              emit(SearchResultsDeleted());
            }
          else
            {
              emit(SearchSuccess(books));

            }
        });
    }

  }

