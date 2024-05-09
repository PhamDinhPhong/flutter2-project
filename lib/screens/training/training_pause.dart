import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga_app/data/yogaData.dart';
import 'package:yoga_app/screens/training/training_exercise_detail.dart';
import 'package:yoga_app/screens/training/training_quit.dart';

class TrainingPause extends StatelessWidget {
  int currentDayIndex;
  int currentExerciseIndex;
  TrainingPause(
      {Key? key,
      required this.currentDayIndex,
      required this.currentExerciseIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentExercise =
        dummyFitnessActivities[currentDayIndex].exercises[currentExerciseIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 80, 94),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 61, 80, 94),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pause",
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: 220,
                          child: Text(
                            currentExercise.name,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TrainingDetail(
                                        currentDay: dummyFitnessActivities[
                                            currentDayIndex],
                                        exerciseIndex: currentExerciseIndex),
                                  ),
                                );
                              },
                              child: SvgPicture.asset(
                                "assets/icons/question.svg",
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        currentExercise.imgGif,
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 370,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'restart');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      alignment: Alignment.centerLeft,
                      backgroundColor: const Color.fromARGB(255, 55, 71, 84)),
                  child: const Text(
                    "Restart this exercise",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 370,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingQuit(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      alignment: Alignment.centerLeft,
                      backgroundColor: const Color.fromARGB(255, 55, 71, 84)),
                  child: const Text(
                    "Quit",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 370,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      alignment: Alignment.centerLeft,
                      backgroundColor: Colors.white),
                  child: const Text(
                    "Resume",
                    style: TextStyle(
                        color: Color.fromARGB(255, 55, 71, 84), fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 130,
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 1,
            ),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.white,
              width: 1.0, // Underline thickness
            ))),
            child: InkWell(
              onTap: () {},
              child: const Text(
                "FeedBack",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
