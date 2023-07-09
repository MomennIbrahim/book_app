import 'package:apps_flutter/constants.dart';
import 'package:apps_flutter/core/utils/app_router.dart';
import 'package:apps_flutter/core/utils/service_locator.dart';
import 'package:apps_flutter/features/home/data/repository/home_repository_implement.dart';
import 'package:apps_flutter/features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/bloc_observe.dart';
import 'features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  Bloc.observer = MyBlocObserver();

  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepositoryImplement>())
                ..getFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepositoryImplement>())
                ..getFeaturedNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimary,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
