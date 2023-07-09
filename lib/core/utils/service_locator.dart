import 'package:apps_flutter/core/utils/api_service.dart';
import 'package:apps_flutter/features/home/data/repository/home_repository_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {

  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepositoryImplement>(HomeRepositoryImplement(
    getIt.get<ApiService>()
  ));
}
