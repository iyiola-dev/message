import 'package:flutter/material.dart';
import 'package:message/core/model/user.dart';
import 'package:message/ui/widget/builder.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return BuildWrapper();
    }
  }
}
