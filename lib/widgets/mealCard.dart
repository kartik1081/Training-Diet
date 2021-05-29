import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:training/modles/meal.dart';
import 'package:training/pages/meal_deatail_screen.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 10),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            new Flexible(
                fit: FlexFit.tight,
                child: new OpenContainer(
                  transitionDuration: new Duration(milliseconds: 700),
                  closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  openBuilder: (context, _) {
                    return new MealDeatailScreen(meal: meal);
                  },
                  closedBuilder: (context, openContainer) {
                    return new GestureDetector(
                      onTap: openContainer,
                      child: new ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: new Image(
                            image: AssetImage(
                              meal.imagePath,
                            ),
                            width: 150,
                            fit: BoxFit.fill,
                            frameBuilder: null,
                            alignment: Alignment.center),
                      ),
                    );
                  },
                )),
            new Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new SizedBox(
                        height: 10,
                      ),
                      new Text(
                        meal.mealTime,
                        style: new TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black87),
                      ),
                      new Text(
                        meal.name,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      new Text(
                        meal.kiloCaloriesBurnt,
                        style: new TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      Row(
                        children: [
                          new Icon(
                            Icons.access_time,
                            color: Colors.black87,
                            size: 14,
                          ),
                          new SizedBox(
                            width: 4,
                          ),
                          new Text(
                            meal.timeTaken,
                            style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                      new SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
