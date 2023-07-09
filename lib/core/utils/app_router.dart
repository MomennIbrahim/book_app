import 'package:apps_flutter/constants.dart';
import 'package:apps_flutter/core/utils/service_locator.dart';
import 'package:apps_flutter/features/home/data/repository/home_repository_implement.dart';
import 'package:apps_flutter/features/home/presentation/controller/similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:apps_flutter/features/home/presentation/view/book_details_view.dart';
import 'package:apps_flutter/features/home/presentation/view/home_view.dart';
import 'package:apps_flutter/features/search/presentation/view/serach_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/data/model/BookModel.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          searchController.text = '';
          return const SearchView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (BuildContext context) =>
                FetchSimilarBooksCubit(getIt.get<HomeRepositoryImplement>()),
            child:  BookDetailsView(bookModel: state.extra as BookModel),
          );
        },
      ),
    ],
  );
}
