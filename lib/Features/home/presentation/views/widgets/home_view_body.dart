import 'package:booklyapp/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'bestSellerListView.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(),
      slivers: [
      SliverToBoxAdapter(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const  [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomAppBar(),
          ),
          FeaturedBooksListView(),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Newest Books',
              style: Styles.textStyle18,
            ),
          ),
          SizedBox(
            height: 20,
          ),


        ],
      ),),
     const  SliverFillRemaining(
       child:  Padding(
       padding: EdgeInsets.symmetric(horizontal: 30),
       child: BestSellerListView(),
     ),)
    ],);

  }
}

