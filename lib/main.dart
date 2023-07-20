import 'package:booklyapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/similar_books_cubit/bloc_observer.dart';
import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';

void main() {
 setupServiceLocator();
 Bloc.observer=SimpleBlocObserver();
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(
                  getIt.get<HomeRepoImpl>()
                )..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) => NewestBooksCubit(
             getIt.get<HomeRepoImpl>()
            )..fetchNewestBooks()),



      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: KPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
