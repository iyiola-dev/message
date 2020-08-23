import 'package:flutter/material.dart';
import 'package:message/ui/views/divider/app/app_login.dart';
import 'package:message/ui/views/divider/app/auth/app_signup.dart';
import 'package:message/ui/views/divider/builder.dart';
import 'package:message/ui/views/divider/web/auth/login.dart';
import 'package:message/ui/views/divider/web/auth/webSignup.dart';
import 'package:message/ui/widget/authenticate.dart';

class RouteNames {
  static const websignup = 'webSignup';
  static const appsignup = 'appSignup';
  static const builder = 'builder';
  static const String webLogin = 'webLogin';
  static const String appLogin = 'appLogin';
  static const String authenticate = 'authenticate';
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.appLogin: (context) => AuthPage(),
    RouteNames.builder: (context) => Wrapper(),
    RouteNames.appsignup: (context) => AppSignup(),
    RouteNames.webLogin: (context) => WebAuth(),
    RouteNames.websignup: (context) => WebSignUp(),
    RouteNames.authenticate: (context) => Authenticate()
  };
}
