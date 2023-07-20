import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/core/utils/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/app_router.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccess) {
          return SizedBox(height: MediaQuery
            .of(context)
            .size
            .height * 0.3,
          child: ListView.builder(
            itemCount: state.books.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(onTap: (){
                  GoRouter.of(context).push(AppRouter.KBookDetailsView,
                      extra: state.books[index]);

                },
                    child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '')),
              );
            }, scrollDirection: Axis.horizontal,),
        );
        } else if(state is FeaturedBooksFailure)
          {
            return CustomErrorMessage(errorMessage: state.errorMessage);
          }
        else
          {
            return SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.3,
              child: ListView.builder(
                itemCount:10,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AspectRatio(aspectRatio: 2.9/4,child:
                    Shimmer.fromColors(child: Container(decoration: BoxDecoration(color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(16)),
                        ), baseColor: Colors.grey[400]!, highlightColor: Colors.grey[300]!),) ,
                  );
                }, scrollDirection: Axis.horizontal,),
            );
              
          }

      },
    );
  }
}
