import 'package:flutter/cupertino.dart';

class UpperBodyWorkout {
  late String imagePath, name, instruction;
  UpperBodyWorkout(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.instruction});
}

final upperBody = [
  [
    UpperBodyWorkout(
      imagePath: "assets/body_muscle.png",
      name: "Bench press",
      instruction: "3 sets - 6 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/body_muscle.png",
      name: "Dumbell press",
      instruction: "4 sets - 6 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/body_muscle.png",
      name: "Dips",
      instruction: "2 sets - 10 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/back_muscle.png",
      name: "Pull ups",
      instruction: "2 sets - 8 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/back_muscle.png",
      name: "Deadlift",
      instruction: "2 sets - 4 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/back_muscle.png",
      name: "Lat pulldown",
      instruction: "4 sets - 6 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/biceps.png",
      name: "Pull ups",
      instruction: "2 sets - 8 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/biceps.png",
      name: "Deadlift",
      instruction: "2 sets - 4 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/biceps.png",
      name: "Lat pulldown",
      instruction: "4 sets - 6 repitions",
    ),
  ],
];
