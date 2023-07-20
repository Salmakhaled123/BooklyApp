import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/book_details_view.dart';
import 'package:booklyapp/Features/home/presentation/views/home_view.dart';
import 'package:booklyapp/Features/search/presentation/manager/search_cubit.dart';
import 'package:booklyapp/Features/search/presentation/views/search_view.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const KhomeView = '/homeView';
  static const KBookDetailsView = '/bookDetailsView';
  static const KSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            getIt.get<HomeRepoImpl>(),
          ),child:const  SearchView(),
        ),

      ),
      GoRoute(
        path: KhomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: KBookDetailsView,
        builder: (context, state) =>
            BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BooksDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
    ],
  );
}
