import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:training/modles/users.dart';

class FlutterFire {
  late String name, email, password, imagePath;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase _database = FirebaseDatabase.instance;
  Future<void> singIn() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signUp() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        Users users = Users(
            name: name, email: email, password: password, imagePath: imagePath);
        String id = _auth.currentUser!.uid;
        _database.reference().child("Users").child("$id").set(users);
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
