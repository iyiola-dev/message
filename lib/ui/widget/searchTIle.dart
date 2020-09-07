import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  final String userName;
  final String email;
  SearchTile({this.email, this.userName});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        userName,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      subtitle: Text(
        email,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      trailing: RaisedButton(
        child: Text('message',
            style: TextStyle(color: Colors.white, fontSize: 16)),
        onPressed: () {},
        color: Colors.blue[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
