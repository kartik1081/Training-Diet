import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase _database = FirebaseDatabase.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  final picker = ImagePicker();
  TextEditingController? name = TextEditingController();
  TextEditingController? email = TextEditingController();

  Future setImage() async {
    try {
      final pickedImage = await picker.getImage(source: ImageSource.gallery);
      setState(() async {
        if (pickedImage != null) {
          String id = _auth.currentUser!.uid;
          print("start");
          Reference ref = _storage.ref().child("Images").child("$id");
          await ref.getDownloadURL().then((value) => {
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
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: new AppBar(
        elevation: 10,
        backgroundColor: Color(0xFF200087),
        title: new Text("Profile"),
      ),
      body: new Stack(
        children: [
          new Positioned(
            top: 0,
            right: 5,
            left: 5,
            height: 340,
            child: new ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
              child: Container(
                color: Colors.white,
                child: new Column(
                  children: [
                    new SizedBox(
                      height: 50,
                    ),
                    new GestureDetector(
                      onTap: () => setImage(),
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage("assets/k.jpg"),
                        radius: 40,
                      ),
                    ),
                    new SizedBox(
                      height: 30,
                    ),
                    new Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: new Column(
                          children: [
                            new TextFormField(
                              controller: name,
                              decoration: new InputDecoration(
                                hintText: "Name",
                                fillColor: Colors.grey[300],
                                filled: true,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    13.0, -5.0, 0.0, -5.0),
                                focusedBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        width: 0.0000000001,
                                        color: Colors.black),
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                enabledBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 0.0000000001, color: Colors.white),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            new SizedBox(
                              height: 7,
                            ),
                            new TextFormField(
                              controller: email,
                              decoration: new InputDecoration(
                                hintText: "Email",
                                fillColor: Colors.grey[300],
                                filled: true,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    13.0, -5.0, 0.0, -5.0),
                                focusedBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        width: 0.0000000001,
                                        color: Colors.black),
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                enabledBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 0.0000000001, color: Colors.white),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 10,
                    ),
                    new Container(
                      child: new ElevatedButton(
                        onPressed: () {
                          String id = _auth.currentUser!.uid;
                          _database
                              .reference()
                              .child("Users")
                              .child("$id")
                              .update({"Name": name, "Email": email});
                        },
                        child: new Text("Save"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
