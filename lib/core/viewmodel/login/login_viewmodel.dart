import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvmdemo/core/helper/navigation_service.dart';
import 'package:mvvmdemo/core/locator/locator.dart';
import 'package:mvvmdemo/core/preference/preference_keys.dart';
import 'package:mvvmdemo/core/preference/prerences.dart';
import 'package:mvvmdemo/core/providers/user_data_provider.dart';
import 'package:mvvmdemo/core/routing/routes.dart';
import 'package:mvvmdemo/core/viewmodel/base_model.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends BaseModel {
  final userNameController = TextEditingController();

  void login(BuildContext context) {
    apiRepository.getPostData().then((value) {
      print(value);
    }).catchError((onError) {
      print(onError);
    });
    if (userNameController.text != "") {
      UserDataProvider userDataProvider =
          Provider.of<UserDataProvider>(context, listen: false);
      userDataProvider.userName = userNameController.text;
      Preferences.setBool(PreferenceKeys.isLogin, true);
      Preferences.setString(PreferenceKeys.userName, userNameController.text);
      NavigationService _navigationService = locator<NavigationService>();
      _navigationService.pushReplacementNamed(Routes.homeRoute);
    } else {
      Fluttertoast.showToast(msg: "Please enter username");
    }
  }

  void resetData() {
    userNameController.clear();
  }
}
