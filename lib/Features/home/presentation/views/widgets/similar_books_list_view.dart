import 'package:booklyapp/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:booklyapp/core/utils/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.15,
            child: ListView.builder(physics: const BouncingScrollPhysics(),
              itemCount: state.books.length ,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                      imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail ?? '' ),
                );
              }, scrollDirection: Axis.horizontal,),
          );
        }else if(state is SimilarBooksFailure)
          {
            return CustomErrorMessage(errorMessage: state.errorMessage);
          }else {
          return   const CustomLoadingIndicator();
        }
      },
    );
  }
}
