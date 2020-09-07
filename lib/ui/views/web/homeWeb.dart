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
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    hintText: 'search Users',
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                              Icon(Icons.search)
                            ],
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
