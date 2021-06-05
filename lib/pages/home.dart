import 'dart:io';
import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:image_picker/image_picker.dart';
import 'package:training/modles/meal.dart';
import 'package:training/pages/setting.dart';
import 'package:training/services/flutterfire.dart';
import 'package:training/widgets/ingredient_progress.dart';
import 'package:training/widgets/mealCard.dart';
import 'package:training/widgets/radialprogress.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'workout.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: unused_element
  late File _image;
  final picker = ImagePicker();
  final today = DateTime.now();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase _database = FirebaseDatabase.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future setImage() async {
    try {
      final pickedImage = await picker.getImage(source: ImageSource.gallery);
      setState(() async {
        if (pickedImage != null) {
          _image = File(pickedImage.path);
          String id = _auth.currentUser!.uid;
          print("start");
          Reference ref = _storage.ref().child("Images").child("$id");
          // ignore: unused_local_variable
          UploadTask _task = ref.putFile(_image);

          // ignore: unused_local_variable
          final url = await ref.getDownloadURL().then((value) => {
                _database
                    .reference()
                    .child("Users")
                    .child("$id")
                    .update({"ProfilePic": value})
              });

          print("end");
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    FlutterFire _flutterfire = FlutterFire();
    // final String id = _auth.currentUser!.uid;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      appBar: new AppBar(
        backgroundColor: Color(0xFF200087),
        elevation: 10,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Text(
                "${formatDate(today, [dd, '-', mm, '-', yyyy])}",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white60),
              ),
              new SizedBox(
                height: 3,
              ),
              new FutureBuilder<String>(
                future: _flutterfire.getName(),
                initialData: '',
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new Text(
                      "Hello, ${snapshot.data}",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return new CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
        // actions: [
        //   new OpenContainer(
        //     closedColor: const Color(0xFF200087),
        //     transitionDuration: new Duration(milliseconds: 200),
        //     openBuilder: (context, action) {
        //       return new Profile();
        //     },
        //     closedBuilder: (context, VoidCallback openContainer) {
        //       return new GestureDetector(
        //         onTap: openContainer,
        //         child: Padding(
        //           padding: const EdgeInsets.only(right: 8.0),
        //           child: new CircleAvatar(
        //             backgroundImage: new AssetImage("assets/k.jpg"),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF200087),
              ),
              accountName: new Text("Kartik Nakrani"),
              accountEmail: new Text("knakrani.1081@gmail.com"),
              // currentAccountPicture: new CircleAvatar(
              //   backgroundImage: NetworkImage("assets/avatar.png", scale: 1.0),
              // ),
            ),
            new ListTile(
                title: new Text("Setting"),
                leading: new Icon(Icons.settings),
                trailing: new Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new Setting(),
                    ),
                  );
                }),
            new Divider(),
            new ListTile(
              title: new Text("Log Out"),
              leading: new Icon(Icons.logout),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                _flutterfire.signOut(context);
              },
            )
          ],
        ),
      ),
      body: new Stack(
        children: [
          Positioned(
            top: 0,
            height: height * 0.25,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.white.withOpacity(0.8),
                  padding: const EdgeInsets.only(top: 20, left: 32, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          RadialProgress(
                            width: width * 0.4,
                            height: width * 0.4,
                            progress: 0.7,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              IngredientProgress(
                                ingredient: "Protein",
                                progress: 0.3,
                                progressColor: Colors.green,
                                leftAmount: 72,
                                width: width * 0.28,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              IngredientProgress(
                                ingredient: "Carbs",
                                progress: 0.2,
                                progressColor: Colors.red,
                                leftAmount: 252,
                                width: width * 0.28,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              IngredientProgress(
                                ingredient: "Fat",
                                progress: 0.1,
                                progressColor: Colors.yellow,
                                leftAmount: 61,
                                width: width * 0.28,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.26,
            right: 0,
            left: 0,
            child: new Container(
              color: Color(0xFFE9E9E9),
              height: height * 0.55,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                      right: 16,
                      left: 32,
                    ),
                    child: new Text(
                      "MEAL FOR TODAY",
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  new Expanded(
                    child: new SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: new Row(
                        children: [
                          new SizedBox(
                            width: 32,
                          ),
                          for (int i = 0; i < meals.length; i++)
                            new MealCard(
                              meal: meals[i],
                            )
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 5.0,
                  ),
                  new Expanded(
                    child: new OpenContainer(
                      closedColor: Color(0xFFE9E9E9),
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fadeThrough,
                      transitionDuration: new Duration(milliseconds: 700),
                      openBuilder: (context, _) {
                        return new WorkOutScreen(name: "Upper Body");
                      },
                      closedBuilder: (context, VoidCallback openContainer) {
                        return new GestureDetector(
                          onTap: openContainer,
                          child: new Container(
                            margin: const EdgeInsets.only(
                              bottom: 30,
                              left: 32,
                              right: 32,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF200099),
                                  const Color(0xFF200040),
                                ],
                              ),
                            ),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 35.0),
                                  child: new Text(
                                    "YOUR NEXT WORKOUT",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 35.0),
                                  child: new Text(
                                    "UPPER BODY",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                new Expanded(
                                  child: new Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      new Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xFF584D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: new Image(
                                          image: AssetImage(
                                            "assets/body_muscle.png",
                                          ),
                                          width: 50,
                                          height: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                      new SizedBox(
                                        width: 30,
                                      ),
                                      new Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xFF584D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: new Image(
                                          image: AssetImage(
                                            "assets/back_muscle.png",
                                          ),
                                          width: 50,
                                          height: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                      new SizedBox(
                                        width: 30,
                                      ),
                                      new Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xFF584D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: new Image(
                                          image: AssetImage(
                                            "assets/biceps.png",
                                          ),
                                          width: 50,
                                          height: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  new SizedBox(
                    height: 3,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
