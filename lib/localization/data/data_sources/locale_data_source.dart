import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_strings.dart';


abstract class LocaleDataSource {
  Future<bool> saveLocale({required String codeLang});

  Future<String> getSaveLocale();
}

class LocaleDataSourceImpl implements LocaleDataSource {
  final SharedPreferences sharedPreferences;

  LocaleDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getSaveLocale() async =>
      sharedPreferences.getString(AppStrings.locale) ?? AppStrings.englishCode;

  @override
  Future<bool> saveLocale({required String codeLang}) async =>
      await sharedPreferences.setString(AppStrings.locale, codeLang);
}
