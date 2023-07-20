import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';
class BooksDetailsSection extends StatelessWidget
{
  const BooksDetailsSection({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child:  CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''
              ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(textAlign: TextAlign.center,
          bookModel.volumeInfo.title! ,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '' ,
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
         BookRating(count: bookModel.volumeInfo.ratingsCount ?? 0,rating:bookModel.volumeInfo.averageRating ?? 0 ,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
         BookAction(bookModel: bookModel),
      ],
    );
  }
}