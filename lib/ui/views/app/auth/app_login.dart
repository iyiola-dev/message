import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:message/core/utils/navigation/app_navigation/app_transition.dart';
import 'package:message/ui/views/app/auth/signupvm.dart';
import 'package:message/ui/widget/builder.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  final Function toggle;
  AuthPage({this.toggle});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Svm>(context);

    return Scaffold(
        backgroundColor: Color(0xfff1f1f8),
        body: model.loading
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
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
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                          child: Text(
                            model.error,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Form(
                            key: model.formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)
                                        ? null
                                        : "Enter correct email";
                                  },
                                  controller: model.emailController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.mail),
                                      hintText: 'E-mail',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: model.passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.security),
                                      hintText: 'password',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.white))),
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
                        InkWell(
                          onTap: () {
                            model.signin();
                            Navigation()
                                .pushToAndReplace(context, BuildWrapper());
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.blue[900],
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(FontAwesomeIcons.google,
                                      color: Colors.red),
                                  Text(
                                    'Sign In With Google',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.red),
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
                                // Navigator.pushNamed(context, RouteNames.appsignup);
                                widget.toggle();
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
