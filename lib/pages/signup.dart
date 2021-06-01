import 'package:flutter/material.dart';
import 'package:training/services/flutterfire.dart';

import 'signin.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FlutterFire _flutterFire = FlutterFire();
  final _form = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red[600],
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(17.0),
              ),
              padding:
                  const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
              margin: const EdgeInsets.all(20.0),
              constraints: BoxConstraints(maxHeight: 360, maxWidth: 300),
              child: new Column(
                children: [
                  new Text(
                    "Sign Up",
                    style: new TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Sofia",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  new Form(
                    key: _form,
                    child: new Column(
                      children: [
                        new TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your name";
                            }
                          },
                          controller: name,
                          cursorHeight: 22.0,
                          decoration: new InputDecoration(
                            hintText: "Enter your name",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(
                                13.0, -5.0, 0.0, -5.0),
                            focusedBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    width: 0.0000000001, color: Colors.black),
                                borderRadius: new BorderRadius.circular(10.0)),
                            enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  width: 0.0000000001, color: Colors.white),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        new TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your email";
                            }
                          },
                          controller: email,
                          cursorHeight: 30.0,
                          decoration: new InputDecoration(
                            hintText: "Enter your email",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(
                                13.0, -5.0, 0.0, -5.0),
                            focusedBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    width: 0.0000000001, color: Colors.black),
                                borderRadius: new BorderRadius.circular(10.0)),
                            enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  width: 0.0000000001, color: Colors.white),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        new TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your password";
                            }
                          },
                          controller: password,
                          decoration: new InputDecoration(
                            hintText: "Enter your password",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(
                                13.0, -5.0, 0.0, -5.0),
                            focusedBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    width: 0.0000000001, color: Colors.black),
                                borderRadius: new BorderRadius.circular(10.0)),
                            enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  width: 0.0000000001, color: Colors.white),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: new TextButton(
                        child: Text(
                          "Already have account",
                          style: new TextStyle(
                              fontSize: 14.0, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              // ignore: non_constant_identifier_names
                              builder: (BuildContext) => new SignIn(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(7.0),
                        overlayColor: MaterialStateProperty.all(Colors.black),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      autofocus: true,
                      onPressed: () {
                        if (_form.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                        _flutterFire.signUp(
                            context, name.text, email.text, password.text);
                      },
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            new Text(
                              "Sign Up",
                              style: new TextStyle(fontSize: 17.0),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            new Icon(Icons.login),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Expanded(
                    child: new ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          elevation: MaterialStateProperty.all(7.0)),
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
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(width: 15.0),
                  new Expanded(
                    child: new ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
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
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
