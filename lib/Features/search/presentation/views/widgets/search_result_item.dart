import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:booklyapp/core/utils/function/launch_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

import '../../../../home/presentation/views/widgets/custom_book_item.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({Key? key, required this.bookModel, }) : super(key: key);
 final  BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          CustomBookImage(imageUrl:
           bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child:  Text(
                    bookModel.volumeInfo.title ?? '',
                    style: Styles.textStyle20.copyWith(fontFamily: KGTSectraFine),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  bookModel.volumeInfo.authors?[0] ?? 'none',
                  style: Styles.textStyle14,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 3,),
                Row(
                  children: [
                    Text(
                      'Free',
                      style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const  Spacer(),
                   IconButton(onPressed: ()async{
                     launchCustomUrl(context, bookModel.volumeInfo.infoLink);
                   }, icon: const Icon(Icons.shop))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
