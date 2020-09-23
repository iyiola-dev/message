import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:message/core/utils/route/routeName.dart';
import 'package:message/core/services/prov.dart';
import 'package:provider/provider.dart';

class WebSignUp extends StatelessWidget {
  final Function toggle;
  WebSignUp({this.toggle});
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Svm>(context);

    return Scaffold(
        body: model.loading
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            image: DecorationImage(
                                image: AssetImage('images/secure.png'))),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome ',
                              style: TextStyle(
                                  letterSpacing: 5,
                                  fontSize: 45,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Please Sign Up',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 25,
                              ),
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
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
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
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        value.isEmpty
                                            ? "please enter the correct password"
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
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
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
                                      'Sign UP',
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
                                color: Color(0xfff1f1f8),
                                height: 50,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(FontAwesomeIcons.google,
                                          color: Colors.red),
                                      Text(
                                        'Sign Up With Google',
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
                                  "Have An Account?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    //model.signUp();
                                    toggle();
                                  },
                                  child: Text(
                                    "Sign In",
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
                    ],
                  ),
                ),
              ));
  }
}
