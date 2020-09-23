import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:message/core/utils/route/routeName.dart';
import 'package:message/core/services/prov.dart';
import 'package:provider/provider.dart';

class AppSignup extends StatefulWidget {
  final Function toggle;
  AppSignup({this.toggle});

  @override
  _AppSignupState createState() => _AppSignupState();
}

class _AppSignupState extends State<AppSignup> {
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
                          height: 40,
                        ),
                        Form(
                            key: model.formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (val) {
                                    return val.isEmpty || val.length < 3
                                        ? 'please provide a valid username not less than 3'
                                        : null;
                                  },
                                  controller: model.userNameController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText: 'UserName',
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
                                  validator: (val) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(val)
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
                                  validator: (val) {
                                    return val.isEmpty || val.length < 3
                                        ? 'please provide a valid password not less than 3'
                                        : null;
                                  },
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
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            model.signUp();
                            Navigator.pushReplacementNamed(
                                context, RouteNames.builder);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.blue[900],
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Sign up',
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
                                    'Sign up With Google',
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
                              "Have an Account?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                widget.toggle();
                              },
                              child: Text(
                                "Sign in",
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
