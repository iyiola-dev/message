import 'package:cloud_firestore/cloud_firestore.dart';
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

  String myName = "";

  getUSerInfo() async {
    myName = await Shared.getUserName();
  }

  createchatroom(String userName) {
    String chatroomID = getChatRoomId(userName, myName);
    List<String> users = [userName, myName];
    Map<String, dynamic> chatroomMap = {
      "users": users,
      "chatroomID": chatroomID
    };
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  //the sign up functions
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

  QuerySnapshot snapshot;

//the signin function
  signin() async {
    if (formkey.currentState.validate()) {
      loading = true;
      Shared.saveEmail(emailController.text);
      db.getUserbyE(emailController.text).then((val) {
        snapshot = val;
        Shared.saveEmail(snapshot.docs[1].get("name"));
      });
      var result = await authMethods.signinwithemail(
          emailController.text.trim(), passwordController.text);
      if (result == null) {
        loading = false;
        error = "invalid email or password";
      }
      notifyListeners();
    }
  }
}
