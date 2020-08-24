import 'package:flutter/widgets.dart';

class Authvm extends ChangeNotifier {
  bool showSignin;
  toggleView() {
    showSignin = !showSignin;
    notifyListeners();
  }
}
