import 'package:flutter/material.dart';
import 'package:mvvmdemo/core/constants/constants.dart';
import 'package:mvvmdemo/core/localization/app_localizations.dart';
import 'package:mvvmdemo/core/preference/preference_keys.dart';
import 'package:mvvmdemo/core/preference/prerences.dart';
import 'package:mvvmdemo/core/viewmodel/login/login_viewmodel.dart';
import 'package:mvvmdemo/ui/view/base_view.dart';

import '../../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel? model;
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (model) {
        this.model = model;
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate('login')),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  if (Preferences.getString(
                          PreferenceKeys.selectedLanguage, LANG_ENG) ==
                      LANG_ENG) {
                    Preferences.setString(
                        PreferenceKeys.selectedLanguage, LANG_HI);
                    MainApp.setLocale(context, Locale(LANG_HI));
                  } else {
                    Preferences.setString(
                        PreferenceKeys.selectedLanguage, LANG_ENG);
                    MainApp.setLocale(context, Locale(LANG_ENG));
                  }
                },
                icon: Icon(Icons.translate),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: model.userNameController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      model.login(context);
                    },
                    child: Text("Login"),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    model!.resetData();
    super.dispose();
  }
}
