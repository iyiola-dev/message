import 'package:flutter/material.dart';
import 'package:message/core/utils/navigation/page_transition/page_transition.dart';
import 'package:message/core/utils/route/routeName.dart';
import 'package:message/ui/views/divider/app/app_login.dart';
import 'package:message/ui/views/divider/app/auth/app_signup.dart';
import 'package:message/ui/views/divider/builder.dart';
import 'package:message/ui/views/divider/web/auth/login.dart';
import 'package:message/ui/views/divider/web/auth/webSignup.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.appLogin:
        return CustomSlideTransition(child: AuthPage());
        break;
      case RouteNames.builder:
        return CustomSlideTransition(child: Wrapper());
        break;
      case RouteNames.webLogin:
        return CustomSlideTransition(child: WebAuth());
        break;
      case RouteNames.appsignup:
        return CustomSlideTransition(child: AppSignup());
        break;
      case RouteNames.websignup:
        return CustomSlideTransition(child: WebSignUp());
        break;
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return CustomSlideTransition(
    child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Page not found',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: Center(
        child: Text(
          'Error! Page not found',
          style: TextStyle(color: Colors.red),
        ),
      ),
    ),
  );
}
