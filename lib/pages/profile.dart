import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: new AppBar(
        backgroundColor: Color(0xFF200087),
        title: new Text("Profile"),
      ),
      body: new Stack(
        children: [
          new Positioned(
            top: 250,
            right: 5,
            left: 5,
            height: 50,
            child: new ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              child: new Container(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
