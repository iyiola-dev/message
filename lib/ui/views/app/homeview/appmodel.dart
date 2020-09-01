import 'package:flutter/widgets.dart';

class AppModel extends ChangeNotifier {
  int currentIndex = 0;
  void toggle(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
