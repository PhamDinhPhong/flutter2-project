import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yoga_app/data/yogaData.dart';
import 'package:yoga_app/screens/training/training_schedule.dart';

class TrainingQuit extends StatelessWidget {
  TrainingQuit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Why quit?",
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 370,
                      child: Text(
                        "This will help us know you better and provide the workout that is more suitable for you.",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        softWrap:
                            true, // Xác định rằng văn bản có thể ngắt dòng
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
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TrainingSchedule(day: dummyFitnessActivities[0])),
                      (Route<dynamic> route) => route.isFirst,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      alignment: Alignment.centerLeft,
                      backgroundColor: const Color.fromARGB(255, 55, 71, 84)),
                  child: const Text(
                    "Just take a look",
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
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TrainingSchedule(day: dummyFitnessActivities[0])),
                      (Route<dynamic> route) => route.isFirst,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      alignment: Alignment.centerLeft,
                      backgroundColor: const Color.fromARGB(255, 55, 71, 84)),
                  child: const Text(
                    "Too hard",
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
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TrainingSchedule(day: dummyFitnessActivities[0])),
                      (Route<dynamic> route) => route.isFirst,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      alignment: Alignment.centerLeft,
                      backgroundColor: const Color.fromARGB(255, 55, 71, 84)),
                  child: const Text(
                    "Don't know how to do it",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TrainingSchedule(day: dummyFitnessActivities[0])),
                  (Route<dynamic> route) => route.isFirst,
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Quit",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 80,
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
