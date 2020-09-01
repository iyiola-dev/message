import 'package:message/ui/views/app/auth/signupvm.dart';
import 'package:message/ui/views/app/homeview/appmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => Svm()),
  ChangeNotifierProvider(create: (_) => AppModel())
];
