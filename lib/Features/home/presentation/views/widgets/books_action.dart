import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:booklyapp/core/utils/function/launch_url.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
class BookAction extends StatelessWidget {
  const BookAction({Key? key, required this.bookModel}) : super(key: key);
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
        const   Expanded(
              child: CustomButton(text: 'Free',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topLeft: Radius.circular(
                      16,
                    )),
              )),
          Expanded(
              child: CustomButton(text: getText(bookModel),
                onPressed: ()async{
                launchCustomUrl(context, bookModel.volumeInfo.previewLink);
                },
                fontSize: 16,
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(
                      16,
                    )),
              )),
        ],
      ),
    );
  }

 String getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink==null)
      {
        return 'Not Available';
      }
    else
      {
        return 'Preview';
      }
 }
}
