import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvmdemo/ui/view/home/home.dart';
import 'package:mvvmdemo/ui/view/login/login.dart';
import 'package:mvvmdemo/ui/view/splash/splash.dart';

import 'routes.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }
}
