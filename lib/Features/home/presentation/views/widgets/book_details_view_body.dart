import 'package:booklyapp/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import '../../../data/models/BookModel.dart';
import 'books_details_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel}) : super(key: key);
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
      SliverFillRemaining(hasScrollBody: false,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children:   [
           const  CustomBookDetailsAppBar(),
          BooksDetailsSection(bookModel: bookModel),
          const   Expanded(child:  SizedBox(height: 50,)),
         const    SimilarBooksSection(),
           const   SizedBox(height: 40,),
          ],
        ),
      ),)
    ],);

  }
}




