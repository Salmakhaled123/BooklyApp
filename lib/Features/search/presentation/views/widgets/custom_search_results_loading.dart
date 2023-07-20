import 'package:booklyapp/Features/search/presentation/views/widgets/custom_image_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/custom_book_item.dart';
class CustomSearchResultsLoading extends StatelessWidget {
  const CustomSearchResultsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            // child:  BookListViewItem(),
            child: SizedBox(
              height: 125,
              child: Row(
                children: [
                  const  CustomBookLoading(),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Shimmer.fromColors(child: Container(height:30,decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,shape: BoxShape.rectangle)),baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[400]!,),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Shimmer.fromColors(child: Container(height:27,decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,shape: BoxShape.rectangle)),baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,),
                        ),
                        const SizedBox(height: 3,),

                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
