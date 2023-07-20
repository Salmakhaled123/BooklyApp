import 'package:booklyapp/Features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:booklyapp/Features/search/presentation/views/widgets/custom_search_results_loading.dart';
import 'package:booklyapp/core/utils/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'best_seller_listview_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.books.length , padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: BookListViewItem(bookModel: state.books[index]),
                        );
                      });
        }
        else if(state is NewestBooksFailure)
          {
return CustomErrorMessage(errorMessage: state.errorMessage);
          }
        else
          {
return  const  CustomSearchResultsLoading();
          }
      },
    );
  }
}
