import 'package:flutter/material.dart';
import 'package:message/ui/views/app/homeapp.dart';
import 'package:message/ui/views/web/homeWeb.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BuildWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenTypeLayout(
        mobile: HomeApp(),
        tablet: HomeWeb(),
        desktop: HomeWeb(),
      ),
    );
  }
}
