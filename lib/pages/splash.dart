import 'dart:async';

import 'package:flutter/material.dart';
import 'package:training/pages/HomePage.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // ignore: todo
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new HomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    late double height = MediaQuery.of(context).size.height;
    late double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: new Stack(
        children: [
          new Positioned(
            height: height * 0.9,
            width: width,
            child: new Container(
              child: Center(
                child: new Image(
                  image: AssetImage("assets/diet.png"),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          new Positioned(
            top: height * 0.91,
            width: width,
            child: new Container(
              child: Center(
                child: new CircularProgressIndicator(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
