import 'package:message/ui/views/divider/app/auth/signupvm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => Svm())
];
