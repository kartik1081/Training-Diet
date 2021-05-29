import 'package:flutter/material.dart';
import 'package:training/modles/meal.dart';

// ignore: must_be_immutable
class MealDeatailScreen extends StatelessWidget {
  late Meal meal;
  MealDeatailScreen({Key? key, required this.meal}) : super(key: key);
  var today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: new CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: const Color(0xFF200087),
            expandedHeight: 300,
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            flexibleSpace: new FlexibleSpaceBar(
              background: new ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),
                child: new Image(
                  image: AssetImage(
                    meal.imagePath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                new SizedBox(
                  height: 20,
                ),
                new ListTile(
                  title: new Text(
                    meal.mealTime.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: new Text(
                    meal.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  trailing: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new Text(
                        "${meal.kiloCaloriesBurnt} kcal",
                        style: new TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                      new SizedBox(
                        height: 3,
                      ),
                      new Text(
                        "${meal.timeTaken} mins",
                        style: new TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: new Text(
                    "INGREDIANTS",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
                new SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < meal.ingredients.length; i++)
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: new Text(
                            meal.ingredients[i],
                            style: new TextStyle(fontSize: 14.0),
                          ),
                        ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: new Text(
                    "PREPARATION",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
                new SizedBox(
                  height: 10,
                ),
                new Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 16, right: 16),
                  child: new Text(
                    meal.preparation,
                    style: new TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
