import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:training/pages/home.dart';
import 'package:training/pages/profile.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import 'search.dart';
import 'signin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late User user;
  FirebaseAuth _auth = FirebaseAuth.instance;
  late TabController tabController;
  late DateTime currentBackPressTime;

  @override
  // ignore: must_call_super
  void initState() {
    _auth.authStateChanges().listen((event) {
      if (event == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new SignIn(),
          ),
        );
      }
    });
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: new DoubleBackToCloseApp(
        snackBar: SnackBar(
            content: new Text(
          "Tap back again to leave",
        )),
        child: new TabBarView(
          controller: tabController,
          children: [
            Home(),
            Search(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: new Material(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        color: Color(0xFF200087),
        child: new TabBar(
          indicatorColor: Colors.white,
          controller: tabController,
          tabs: [
            new Tab(
              icon: Icon(Icons.home),
            ),
            new Tab(
              icon: Icon(Icons.search),
            ),
            new Tab(
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }

  // Future<bool> onWillPop() {
  //   DateTime now = DateTime.now();
  //   if (currentBackPressTime == null ||
  //       now.difference(currentBackPressTime) > Duration(seconds: 2)) {
  //     currentBackPressTime = now;
  //     Fluttertoast.showToast(msg: exit_warning);
  //     return Future.value(false);
  //   }
  //   return Future.value(true);
  // }
}
