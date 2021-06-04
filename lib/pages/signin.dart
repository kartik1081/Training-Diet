import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training/services/flutterfire.dart';

import 'signup.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FlutterFire _flutterFire = FlutterFire();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.red[600],
      body: new SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: new Stack(
            children: [
              new Positioned(
                top: height * 0.25,
                height: height * 40,
                right: 20,
                left: 20,
                child: new ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  child: new Container(
                    color: Colors.grey[200],
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        new SizedBox(
                          height: 20,
                        ),
                        new Text(
                          "Sign In",
                          style: new TextStyle(fontSize: 30),
                        ),
                        new SizedBox(
                          height: 50,
                        ),
                        new Form(
                          child: new Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your email";
                                    }
                                  },
                                  controller: email,
                                  cursorHeight: 22.0,
                                  decoration: new InputDecoration(
                                    hintText: "Enter your email",
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        13.0, -5.0, 0.0, -5.0),
                                    focusedBorder: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            width: 0.0000000001,
                                            color: Colors.black),
                                        borderRadius:
                                            new BorderRadius.circular(10.0)),
                                    enabledBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          width: 0.0000000001,
                                          color: Colors.white),
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                new SizedBox(
                                  height: 10.0,
                                ),
                                new TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your password";
                                    }
                                  },
                                  controller: password,
                                  cursorHeight: 30.0,
                                  decoration: new InputDecoration(
                                    hintText: "Enter your password",
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        13.0, -5.0, 0.0, -5.0),
                                    focusedBorder: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            width: 0.0000000001,
                                            color: Colors.black),
                                        borderRadius:
                                            new BorderRadius.circular(10.0)),
                                    enabledBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          width: 0.0000000001,
                                          color: Colors.white),
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: new Container(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: new TextButton(
                                child: Text(
                                  "Create account",
                                  style: new TextStyle(
                                      fontSize: 14.0, color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    new MaterialPageRoute(
                                      // ignore: non_constant_identifier_names
                                      builder: (BuildContext) => new SignUp(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        new Container(
                          width: 110,
                          child: new ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(7),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: () {
                              _flutterFire.singIn(
                                  context, email.text, password.text);
                            },
                            child: new Text("Sign In"),
                          ),
                        ),
                        new SizedBox(
                          height: 25,
                        ),
                        new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              new Expanded(
                                child: new ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      elevation:
                                          MaterialStateProperty.all(7.0)),
                                  onPressed: () {
                                    _flutterFire.googleSignIn(context);
                                  },
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      new Image.asset("assets/google.jpg"),
                                      new SizedBox(
                                        width: 7.0,
                                      ),
                                      new Text(
                                        "Google",
                                        style: new TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              new SizedBox(width: 15.0),
                              new Expanded(
                                child: new ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue),
                                    elevation: MaterialStateProperty.all(7.0),
                                  ),
                                  onPressed: () {
                                    // _flutterFire.signInWithFacebook(context);
                                  },
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      new Icon(Icons.facebook),
                                      new SizedBox(
                                        width: 5.0,
                                      ),
                                      new Text(
                                        "Facebook",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
