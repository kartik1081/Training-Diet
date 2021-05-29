import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:training/modles/upperbodyworkout.dart';

// ignore: must_be_immutable
class WorkOutScreen extends StatelessWidget {
  late String name;
  WorkOutScreen({Key? key, required this.name}) : super(key: key);
  final today = DateTime.now();
  late UpperBodyWorkout upperBodyWorkout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF200087),
      body: new SingleChildScrollView(
        child: new Padding(
          padding: const EdgeInsets.only(
              top: 50.0, right: 16.0, left: 16.0, bottom: 16.0),
          child: new Column(
            children: [
              new IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: new Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              new SizedBox(
                height: 10,
              ),
              new ListTile(
                title: new Text(
                  "${formatDate(today, [dd, '-', mm, '-', yyyy])}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                subtitle: new Text(
                  "$name",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                trailing: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        new Icon(
                          Icons.access_time,
                          color: Colors.white38,
                        ),
                        new SizedBox(
                          width: 5,
                        ),
                        new Text(
                          "60 mins",
                          style: new TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    ),
                    new SizedBox(
                      height: 5,
                    ),
                    new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        new Icon(
                          Icons.speed,
                          color: Colors.white38,
                        ),
                        new SizedBox(
                          width: 5,
                        ),
                        new Text(
                          "Easy",
                          style: new TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
              ),
              for (int i = 0; i < upperBody.length; i++)
                new Column(
                  children: [
                    new SizedBox(
                      height: 30,
                    ),
                    for (int j = 0; j < upperBody[i].length; j++)
                      new ListTile(
                        leading: new Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: const Color(0xFF5B4D9D),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: new Image(
                            image: AssetImage(upperBody[i][j].imagePath),
                            width: 40,
                            height: 40,
                            color: Colors.white,
                          ),
                        ),
                        title: new Text(
                          upperBody[i][j].name,
                          style: new TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        subtitle: new Text(
                          upperBody[i][j].instruction,
                          style: new TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
