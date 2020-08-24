import 'package:flutter/material.dart';
import 'package:message/core/utils/navigation/page_transition/page_transition.dart';
import 'package:message/core/utils/route/routeName.dart';
import 'package:message/ui/views/app/auth/app_login.dart';
import 'package:message/ui/views/app/auth/app_signup.dart';
import 'package:message/ui/views/web/auth/login.dart';
import 'package:message/ui/views/web/auth/webSignup.dart';
import 'package:message/ui/widget/builder.dart';
import 'package:message/ui/widget/Wrapper.dart';
import 'package:message/ui/widget/authenticate/authenticate.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.appLogin:
        return CustomSlideTransition(child: AuthPage());
        break;
      case RouteNames.builder:
        return CustomSlideTransition(child: BuildWrapper());
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
      case RouteNames.authenticate:
        return CustomSlideTransition(child: Authenticate());
        break;
      case RouteNames.wrapper:
        return CustomSlideTransition(child: Wrapper());
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
