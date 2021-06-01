import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:training/pages/home.dart';
import 'package:training/pages/profile.dart';

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

  @override
  // ignore: must_call_super
  void initState() {
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    return new Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: new TabBarView(
        controller: tabController,
        children: [
          Home(),
          Search(),
          Profile(),
        ],
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
}
