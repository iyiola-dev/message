import 'package:message/core/model/user.dart';
import 'package:message/core/services/auth.dart';
import 'package:message/core/services/prov.dart';
import 'package:message/ui/views/app/homeview/appmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => Svm()),
  ChangeNotifierProvider(create: (_) => AppModel()),
  StreamProvider<Users>.value(
    value: Auth().user,
  )
];
