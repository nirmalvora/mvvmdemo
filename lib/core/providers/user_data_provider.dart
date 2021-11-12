import 'package:flutter/cupertino.dart';

class UserDataProvider extends ChangeNotifier {
  String? _userName = "Nirmal";

  String? get userName => _userName;

  set userName(String? value) {
    _userName = value;
    notifyListeners();
  }
}
