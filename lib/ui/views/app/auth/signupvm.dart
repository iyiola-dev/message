import 'package:flutter/widgets.dart';
import 'package:message/core/services/auth.dart';
import 'package:message/core/services/db.dart';

class Svm extends ChangeNotifier {
  Db db = new Db();
  Auth authMethods = Auth();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool loading = false;
  final formkey = GlobalKey<FormState>();
  signUp() {
    if (formkey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "email": emailController.text,
        "name": userNameController.text
      };
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
}
