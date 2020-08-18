import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:message/core/utils/route/RouteGenerator.dart';
import 'package:message/core/utils/route/routeName.dart';
import 'package:provider/provider.dart';

import 'core/utils/provider.dart';

void main() {
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
      initialRoute: RouteNames.builder,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
