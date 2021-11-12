import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mvvmdemo/core/helper/navigation_service.dart';
import 'package:mvvmdemo/core/preference/preference_keys.dart';
import 'package:mvvmdemo/core/preference/prerences.dart';
import 'package:mvvmdemo/core/routing/routes.dart';
import 'package:mvvmdemo/provider_setup.dart';
import 'package:provider/provider.dart';

import 'core/constants/constants.dart';
import 'core/localization/app_localizations.dart';
import 'core/locator/locator.dart';
import 'core/routing/router.dart';

void main() {
  setupLocator();
  Provider.debugCheckInvalidValueType = null;
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale locale) {
    _MainAppState state = context.findAncestorStateOfType<_MainAppState>()!;
    state.setLocale(locale);
  }

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    Preferences.init().then((value) {
      setLanguage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigationKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        locale: _locale,
        supportedLocales: const [
          Locale(LANG_ENG, ''),
          Locale(LANG_HI, ''),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        onGenerateRoute: PageRouter.generateRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }

  void setLanguage() {
    _locale = Locale(
        Preferences.getString(PreferenceKeys.selectedLanguage, LANG_ENG), "");
  }
}
