import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/cubit/locale_cubit.dart';
import 'localization/data/data_sources/locale_data_source.dart';
import 'localization/data/repositories/locale_repository_impl.dart';
import 'localization/domain/repositories/locale_repository.dart';
import 'localization/domain/use_cases/get_save_locale_usecase.dart';
import 'localization/domain/use_cases/save_locale_usecase.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  /// FEATURES
  // BLOC

    sl.registerFactory(
      () => LocaleCubit(getSavedLocaleUseCase:sl(), saveLocaleUseCase: sl()));
  // sl.registerFactory(
  //     () => XCubit(sharedPreferences: sl()));

  // USE CASES

  sl.registerLazySingleton(() => SaveLocaleUseCase(localeRepository: sl()));
  sl.registerLazySingleton(() => GetSavedLocaleUseCase(localeRepository: sl()));

  // REPOSITORY

sl.registerLazySingleton<LocaleRepository>(() => LocaleRepositoryImpl(localeDataSource: sl()));
  // DATA SOURCE
  sl.registerLazySingleton<LocaleDataSource>(() => LocaleDataSourceImpl(sharedPreferences: sl()));

  /// CORE

  /// EXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  }
