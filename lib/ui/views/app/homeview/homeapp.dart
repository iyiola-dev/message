import 'package:flutter/material.dart';
import 'package:message/ui/views/app/homeview/appMessage.dart';
import 'package:message/ui/views/app/homeview/appProfile.dart';
import 'package:message/ui/views/app/homeview/appSearch.dart';
import 'package:message/ui/views/app/homeview/appmodel.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final List<Widget> _children = [AppMessage(), AppSearch(), AppProfile()];
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AppModel>(context);

    return Scaffold(
      body: _children[model.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          onTap: model.toggle,
          items: [
            BottomNavigationBarItem(
                title: Text('Chat'), icon: Icon(Icons.message)),
            BottomNavigationBarItem(
                title: Text('Search'), icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                title: Text('Profile'), icon: Icon(Icons.person_outline))
          ]),
    );
  }
}
