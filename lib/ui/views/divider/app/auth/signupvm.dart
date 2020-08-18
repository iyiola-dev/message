import 'package:flutter/widgets.dart';
import 'package:message/core/services/auth.dart' as fb;

class Svm extends ChangeNotifier {
  fb.Auth authMethods = fb.Auth();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool loading = false;
  final formkey = GlobalKey<FormState>();
  signUp() {
    if (formkey.currentState.validate()) {
      loading = true;
      authMethods
          .signupWithEmail(emailController.text.trim(), passwordController.text)
          .then((value) => print(value));
      notifyListeners();
    }
  }
}
