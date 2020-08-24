import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:message/core/utils/route/routeName.dart';

class WebAuth extends StatelessWidget {
  final Function toggle;
  WebAuth({this.toggle});
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                        letterSpacing: 5,
                        fontSize: 45,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Continue where you left off',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                      child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: 'E-mail',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.security),
                            hintText: 'password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white))),
                      )
                    ],
                  )),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Forgotten password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.blue[900],
                      height: 50,
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Color(0xfff1f1f8),
                      height: 50,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(FontAwesomeIcons.google, color: Colors.red),
                            Text(
                              'Sign In With Google',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.websignup);
                          //toggle();
                        },
                        child: Text(
                          "Create one",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.blue[900]),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  image:
                      DecorationImage(image: AssetImage('images/secure.png'))),
            ),
          ],
        ),
      ),
    ));
  }
}
