import 'package:flutter/cupertino.dart';

class Users {
  late String name;
  late String email;
  late String password;
  late String imagePath;

  Users(
      {Key? key,
      required this.name,
      required this.email,
      required this.password,
      required this.imagePath});
}
