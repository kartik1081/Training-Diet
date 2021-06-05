import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Users {
  late String? id;
  late String? name;
  late String? email;
  late String? password;
  late String? imagePath;

  Users({Key? key, this.name, this.email, this.password, this.imagePath});

  Users.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key,
        name = snapshot.value["Name"],
        imagePath = snapshot.value["ProfilePic"],
        email = snapshot.value["Email"];
  toJson() {
    return {
      "imagePath": imagePath,
      "name": name,
      "email": email,
    };
  }
}
