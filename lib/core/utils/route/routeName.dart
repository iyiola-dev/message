import 'dart:js';

import 'package:flutter/material.dart';
import 'package:message/ui/views/app/auth/app_login.dart';
import 'package:message/ui/views/app/auth/app_signup.dart';
import 'package:message/ui/views/web/auth/login.dart';
import 'package:message/ui/views/web/auth/webSignup.dart';
import 'package:message/ui/widget/builder.dart';
import 'package:message/ui/widget/Wrapper.dart';
import 'package:message/ui/widget/authenticate/authenticate.dart';

class RouteNames {
  static const websignup = 'webSignup';
  static const appsignup = 'appSignup';
  static const builder = 'builder';
  static const String webLogin = 'webLogin';
  static const String appLogin = 'appLogin';
  static const String authenticate = 'authenticate';
  static const String wrapper = 'wrapper';
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.appLogin: (context) => AuthPage(),
    RouteNames.builder: (context) => BuildWrapper(),
    RouteNames.appsignup: (context) => AppSignup(),
    RouteNames.webLogin: (context) => WebAuth(),
    RouteNames.websignup: (context) => WebSignUp(),
    RouteNames.authenticate: (context) => Authenticate(),
    RouteNames.wrapper: (context) => Wrapper()
  };
}
