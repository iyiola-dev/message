import 'package:flutter/material.dart';
import 'package:message/ui/views/divider/web/auth/login.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'app/app_login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenTypeLayout(
        mobile: AuthPage(),
        tablet: WebAuth(),
        desktop: WebAuth(),
      ),
    );
  }
}
