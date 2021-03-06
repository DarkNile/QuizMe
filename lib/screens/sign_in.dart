import 'package:dtcapp/animation/fade_animation.dart';
import 'package:dtcapp/screens/sign_up.dart';
import 'package:dtcapp/screens/introduction_page.dart';
import 'package:dtcapp/services/authentication.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  AuthenticationService authenticationService = new AuthenticationService();
  bool _isLoading = false;

  signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authenticationService
          .signInByEmailAndPassword(email.trim(), password)
          .then((val) {
        if (val != null) {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => StartQuiz()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Form(
                key: _formKey,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [
                        Colors.blue[900],
                        Colors.blue[800],
                        Colors.blue[400]
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FadeAnimation(
                                1,
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                                1.3,
                                Text(
                                  "Welcome Back",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  topRight: Radius.circular(60))),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(30),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                  ),
                                  FadeAnimation(
                                      1.4,
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      225, 95, 27, .3),
                                                  blurRadius: 20,
                                                  offset: Offset(0, 10))
                                            ]),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[200]))),
                                              child: TextFormField(
                                                validator: (val) {
                                                  return val.isEmpty
                                                      ? "Please enter your email address"
                                                      : null;
                                                },
                                                decoration: InputDecoration(
                                                    hintText: "Email Address",
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    border: InputBorder.none),
                                                onChanged: (val) {
                                                  email = val;
                                                },
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[200]))),
                                              child: TextFormField(
                                                obscureText: true,
                                                validator: (val) {
                                                  return val.isEmpty
                                                      ? "Please enter your password"
                                                      : null;
                                                },
                                                decoration: InputDecoration(
                                                    hintText: "Password",
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    border: InputBorder.none),
                                                onChanged: (val) {
                                                  password = val;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  FadeAnimation(
                                      1.5,
                                      Text(
                                        "Forgot Password?",
                                        style: TextStyle(color: Colors.grey),
                                      )),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      signIn();
                                    },
                                    child: FadeAnimation(
                                        1.6,
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 50),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.blue[900]),
                                          child: Center(
                                            child: Text(
                                              "Login",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  FadeAnimation(
                                      1.7,
                                      Text(
                                        "Don't have an account ?",
                                        style: TextStyle(color: Colors.grey),
                                      )),
                                  SizedBox(
                                      height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignUp()));
                                    },
                                    child: FadeAnimation(
                                      1.7,
                                      Text("Register Now", style: TextStyle(
                                        color: Colors.red[900], fontWeight: FontWeight.bold,
                                        fontSize: 18
                                      ),),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
//                                  Row(
//                                    children: <Widget>[
//                                      Expanded(
//                                        child: FadeAnimation(
//                                            1.8,
//                                            Container(
//                                              height: 50,
//                                              decoration: BoxDecoration(
//                                                  borderRadius:
//                                                      BorderRadius.circular(50),
//                                                  color: Colors.blue),
//                                              child: Center(
//                                                child: Text(
//                                                  "Facebook",
//                                                  style: TextStyle(
//                                                      color: Colors.white,
//                                                      fontWeight:
//                                                          FontWeight.bold),
//                                                ),
//                                              ),
//                                            )),
//                                      ),
//                                      SizedBox(
//                                        width: 30,
//                                      ),
//                                      Expanded(
//                                        child: FadeAnimation(
//                                            1.9,
//                                            Container(
//                                              height: 50,
//                                              decoration: BoxDecoration(
//                                                  borderRadius:
//                                                      BorderRadius.circular(50),
//                                                  color: Colors.black),
//                                              child: Center(
//                                                child: Text(
//                                                  "Github",
//                                                  style: TextStyle(
//                                                      color: Colors.white,
//                                                      fontWeight:
//                                                          FontWeight.bold),
//                                                ),
//                                              ),
//                                            )),
//                                      )
//                                    ],
//                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}
