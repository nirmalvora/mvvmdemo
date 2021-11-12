import 'package:flutter/material.dart';
import 'package:mvvmdemo/core/locator/locator.dart';
import 'package:mvvmdemo/core/preference/preference_keys.dart';
import 'package:mvvmdemo/core/preference/prerences.dart';
import 'package:mvvmdemo/core/providers/user_data_provider.dart';
import 'package:mvvmdemo/core/routing/routes.dart';
import 'package:mvvmdemo/core/viewmodel/network_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    locator<NetworkViewModel>().initListener();
    super.initState();
    Preferences.init();
    checkIfLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }

  void checkIfLogin() {
    Future.delayed(Duration(seconds: 3), () {
      if (Preferences.getBool(PreferenceKeys.isLogin, false)) {
        UserDataProvider userDataProvider =
            Provider.of<UserDataProvider>(context, listen: false);
        userDataProvider.userName =
            Preferences.getString(PreferenceKeys.userName, "");
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
    });
  }
}
