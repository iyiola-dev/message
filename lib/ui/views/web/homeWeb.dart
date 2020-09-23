import 'package:flutter/material.dart';
import 'package:message/core/utils/size_config/config.dart';

class HomeWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: Config.xMargin(context, 31.3),
              height: MediaQuery.of(context).size.height,
              color: Colors.blue[900],
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: Config.yMargin(context, 18),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            child: TextFormField(
                              /*  onChanged: (value) {
                        db
                            .getUserByUsername(_searchController.text)
                            .then((val) {
                          setState(() {
                            searchSnapshot = val;
                          });
                          print(val.toString());
                        });
                        }, */
                              // controller: _searchController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'search Users',
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: Config.xMargin(context, 80),
                color: Colors.white,
                child: Center(
                  child: Text(
                    'you are connected',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
