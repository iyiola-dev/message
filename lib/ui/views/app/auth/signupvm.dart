import 'package:flutter/widgets.dart';
import 'package:message/core/services/auth.dart';
import 'package:message/core/services/db.dart';
import 'package:message/core/services/s_preferences.dart';

class Svm extends ChangeNotifier {
  Db db = new Db();
  Auth authMethods = Auth();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String error = '';
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  signUp() {
    if (formkey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "email": emailController.text,
        "name": userNameController.text
      };
      Shared.saveEmail(emailController.text);
      Shared.saveuserName(userNameController.text);
      loading = true;
      authMethods
          .signupWithEmail(emailController.text.trim(), passwordController.text)
          .then((value) {
        db.uploadDocuments(userInfoMap);
        print(value);
      });

      notifyListeners();
    }
  }

  signin() async {
    if (formkey.currentState.validate()) {
      loading = true;
      var result = await authMethods.signinwithemail(
          emailController.text, passwordController.text);
      if (result == null) {
        loading = false;
        error = "invalid email or password";
      }
    }
  }
}
