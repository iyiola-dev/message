import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:message/core/model/user.dart';
import 'package:message/core/services/auth.dart';
import 'package:message/core/utils/route/RouteGenerator.dart';
import 'package:message/core/utils/route/routeName.dart';
import 'package:provider/provider.dart';

import 'core/utils/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize firebase according to the new documentation
  // https://firebase.flutter.dev/docs/overview#initializing-flutterfire
  // You can move this code somewhere else
  await Firebase.initializeApp();
  runApp((MultiProvider(providers: providers, child: MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteNames.wrapper,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
