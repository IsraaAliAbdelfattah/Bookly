import 'package:bookly/Features/home/presentation/views/book_details.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/data/model/book/book.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import '../../Features/splash/presentation/views/splash_view.dart';
import 'service_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child:  BookDetailsView(
            book:state.extra as Book,
          ),
          ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      )
    ],
  );
}
