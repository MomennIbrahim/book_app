import 'package:apps_flutter/core/utils/service_locator.dart';
import 'package:apps_flutter/features/home/data/repository/home_repository_implement.dart';
import 'package:apps_flutter/features/search/controller/search_cubit.dart';
import 'package:apps_flutter/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(getIt.get<HomeRepositoryImplement>()),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
