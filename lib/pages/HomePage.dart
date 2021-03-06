import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:training/modles/meal.dart';
import 'package:training/pages/workout.dart';
import 'package:training/widgets/ingredient_progress.dart';
import 'package:training/widgets/mealCard.dart';
import 'package:date_format/date_format.dart';
import 'package:training/widgets/radialprogress.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return new Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: new Stack(
        children: [
          Positioned(
            top: 0,
            height: height * 0.36,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 20, left: 32, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "${formatDate(today, [dd, '-', mm, '-', yyyy])}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        "Hello, Kartik",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                      trailing: ClipOval(child: Image.asset("assets/k.jpg")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
          Positioned(
            top: height * 0.38,
            right: 0,
            left: 0,
            child: new Container(
              color: Colors.grey[200],
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
                    height: 3.0,
                  ),
                  new Expanded(
                    child: new OpenContainer(
                      closedColor: const Color(0xFFE9E9E9),
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
                              bottom: 10,
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
      bottomNavigationBar: new ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        child: new BottomNavigationBar(
          iconSize: 33,
          unselectedIconTheme: IconThemeData(
            color: Colors.black54,
          ),
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Home",
              tooltip: "Home",
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              label: "Search",
              tooltip: "Search",
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                label: "Person",
                tooltip: "Profile"),
          ],
        ),
      ),
    );
  }
}
