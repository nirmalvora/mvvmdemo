import 'package:flutter/cupertino.dart';
import 'package:mvvmdemo/core/enums/viewstates.dart';
import 'package:mvvmdemo/core/locator/locator.dart';
import 'package:mvvmdemo/core/repositories/api_repository.dart';

class BaseModel extends ChangeNotifier {
  APIRepository apiRepository = locator<APIRepository>();

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  void updateUI() {
    notifyListeners();
  }
}
