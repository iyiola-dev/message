import 'package:flutter/material.dart';
import 'package:message/ui/views/app/auth/app_login.dart';
import 'package:message/ui/views/app/auth/app_signup.dart';
import 'package:message/ui/views/web/auth/login.dart';
import 'package:message/ui/views/web/auth/webSignup.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Authenticate extends StatefulWidget {
  final Function toggle;
  Authenticate({this.toggle});
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin = true;
  void toggleView() {
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (showSignin == true) {
      return ScreenTypeLayout(
        mobile: AuthPage(toggle: toggleView),
        tablet: WebAuth(toggle: toggleView),
        desktop: WebAuth(toggle: toggleView),
      );
    } else {
      return ScreenTypeLayout(
        mobile: AppSignup(toggle: toggleView),
        tablet: WebSignUp(toggle: toggleView),
        desktop: WebSignUp(toggle: toggleView),
      );
    }
  }
}
