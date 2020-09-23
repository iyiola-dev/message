import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:message/core/services/db.dart';
import 'package:message/ui/widget/searchTIle.dart';

class AppSearch extends StatefulWidget {
  @override
  _AppSearchState createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {
  TextEditingController _searchController = TextEditingController();
  Db db = Db();
  QuerySnapshot searchSnapshot;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 20,
                      height: 40,
                      child: TextFormField(
                        onChanged: (value) {
                          db
                              .getUserByUsername(_searchController.text)
                              .then((val) {
                            setState(() {
                              searchSnapshot = val;
                            });
                          });
                        },
                        controller: _searchController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'search Users',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                  ),
                  /*     IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        db
                            .getUserByUsername(
                              _searchController.text,
                            )
                            .then((val) => print(val.toString()));
                      }) */
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: searchList())
            ],
          ),
        ),
      ),
    );
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.docs.length,
            itemBuilder: (context, index) {
              return SearchTile(
                userName: searchSnapshot.docs[index].get('name'),
                email: searchSnapshot.docs[index].get('email'),
              );
            })
        : Container(
            child: Center(child: Text('data')),
          );
  }
}
