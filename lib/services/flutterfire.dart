import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training/modles/users.dart';
import 'package:training/pages/HomePage.dart';
import 'package:training/pages/signin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FlutterFire {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase _database = FirebaseDatabase.instance;

  Future<void> singIn(
      BuildContext context, String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
            email: email.toString(),
            password: password.toString(),
          )
          .whenComplete(
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => new HomePage(),
              ),
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
        _database
            .reference()
            .child("flutter-28edc-default-rtdb")
            .child("Users")
            .child("$id")
            .set(users)
            .asStream();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new HomePage(),
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

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => new SignIn(),
      ),
    );
  }

  Future<void> googleSignIn(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).whenComplete(
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => new HomePage(),
            ),
          ),
        );
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    // Trigger the sign-in flow
    final AccessToken result =
        (await FacebookAuth.instance.login()) as AccessToken;

    // Create a credential from the access token
    final facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .whenComplete(
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contex) => new HomePage(),
            ),
          ),
        );
  }
}
