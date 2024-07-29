import 'package:ringo/bloc/lang/language_cubit.dart';
import 'package:country_picker/country_picker.dart';
import 'package:ringo/ui/screens/login/bloc/login_bloc.dart';
import 'package:ringo/ui/screens/login/login_screen.dart';
import 'package:ringo/ui/screens/splash/splash_screen.dart';
import 'package:ringo/util/lang/app_localization.dart';
import 'package:ringo/util/routes/routes.dart';
import 'package:ringo/util/state_management/providers_manager.dart';
import 'package:ringo/util/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: ProviderManager.providers,
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, localeState) {
          return MaterialApp(
            title: 'Ringo',
            theme: AppTheme(localeState).themeDataLight,
            debugShowCheckedModeBanner: false,

            /// the list of our supported locals for our app
            /// currently we support only 2 English, Arabic ...
            supportedLocales: AppLocalizations.supportLocales,

            /// these delegates make sure that the localization data for the proper
            /// language is loaded ...
            localizationsDelegates: const [
              /// this for selecting the county localization
              CountryLocalizations.delegate,

              /// A class which loads the translations from JSON files
              AppLocalizations.delegate,

              /// Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,

              /// Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,

              GlobalCupertinoLocalizations.delegate,
            ],

            /// Returns a locale which will be used by the app
            localeResolutionCallback: AppLocalizations.localeResolutionCallback,
            locale: localeState,
            home: const SplashScreen(),
            routes: Routes.routes,
          );
        },
      ),
    );
  }
}
