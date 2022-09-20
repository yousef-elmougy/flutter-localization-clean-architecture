import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_clean_arch/screen.dart';

import 'localization/cubit/locale_cubit.dart';
import 'injection_container.dart' as di;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => di.sl<LocaleCubit>()..getSavedLocale(),
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              for (Locale supportedLocale in supportedLocales) {
                if (locale != null &&
                    supportedLocale.languageCode == locale.languageCode &&
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.elementAt(2);
            },
            home: const HomeScreen(),
          ),
        ),
      );
}
