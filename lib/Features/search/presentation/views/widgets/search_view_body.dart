import 'package:booklyapp/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
 const SearchViewBody({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          CustomSearchTextField(),
         const  SizedBox(height: 16,),
        const   Text(
            'Search Results',
            style: Styles.textStyle18,
          ),
        const   SizedBox(height: 16,),
        const   Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}



