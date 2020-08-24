import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:message/core/utils/route/routeName.dart';

class AuthPage extends StatelessWidget {
  final Function toggle;
  AuthPage({this.toggle});
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff1f1f8),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(22),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset('images/light.png'),
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
                        color: Colors.white,
                        height: 50,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(FontAwesomeIcons.google, color: Colors.red),
                              Text(
                                'Sign In With Google',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red),
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
                            Navigator.pushNamed(context, RouteNames.appsignup);
                            // toggle();
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
                  ]),
            )));
  }
}
