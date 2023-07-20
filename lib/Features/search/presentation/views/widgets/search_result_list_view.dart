import 'package:booklyapp/Features/search/presentation/views/widgets/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/custom_error_widget.dart';
import '../../manager/search_cubit.dart';
import 'custom_search_results_loading.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // child:  BookListViewItem(),
                  child: SearchResultItem(
                    bookModel: state.books[index],
                  ),
                );
              });
        } else if (state is SearchFailure) {
          return CustomErrorMessage(errorMessage: state.errorMessage);
        } else  if(state is SearchLoading)
        {
          return const CustomSearchResultsLoading();
        }
        return  Center(child:Image.asset('assets/images/search.png'));

      },
    );
  }
}
