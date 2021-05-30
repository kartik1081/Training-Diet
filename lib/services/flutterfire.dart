import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training/main.dart';
import 'package:training/modles/users.dart';

class FlutterFire {
  // late String? name, email, password, imagePath;
  // FlutterFire({Key? key, this.name, this.email, this.password, this.imagePath});
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase _database = FirebaseDatabase.instance;
  Future<void> singIn(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.toString(), password: password.toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => new MyApp(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signUp(
      BuildContext context, String name, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .whenComplete(() {
        Users users = Users(
            name: name.toString(),
            email: email.toString(),
            password: password.toString());
        String id = _auth.currentUser!.uid;
        _database.reference().child("Users").child("$id").set(users);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new MyApp(),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
