import 'package:mvvmdemo/core/viewmodel/base_model.dart';

class HomeViewModel extends BaseModel {
  int _count = 0;

  int get count => _count;

  set count(int value) {
    _count = value;
    updateUI();
  }

  incrementCount() {
    count++;
    updateUI();
  }

  decrementCount() {
    count--;
    updateUI();
  }
}
