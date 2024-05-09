import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/data/yogaData.dart';
import 'package:yoga_app/screens/training/training_exercise_detail.dart';
import 'package:yoga_app/screens/training/training_start.dart';

class TrainingRest extends StatefulWidget {
  final int currentExerciseIndex;
  final int dayNumber; // Thêm dòng này để nhận dayNumber
  const TrainingRest(
      {super.key, required this.currentExerciseIndex, required this.dayNumber});

  @override
  State<TrainingRest> createState() => _TrainingRestState();
}

class _TrainingRestState extends State<TrainingRest> {
  int timeLeft = 30;
  Timer? _countDownTimer;
  int currentDayIndex = 0;
  int currentExerciseIndex = 0;

  @override
  void initState() {
    super.initState();
    currentDayIndex = widget.dayNumber - 1;
    currentExerciseIndex = widget.currentExerciseIndex + 1;
    _startCountDown();
  }

  String formatDuration(int seconds) {
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  void _startCountDown() {
    _countDownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timeLeft > 0) {
          setState(() {
            timeLeft--;
          });
        } else {
          timer.cancel();
          _navigateToTrainingStart();
        }
      },
    );
  }

  void _navigateToTrainingStart() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TrainingStart(
          dayNumber: widget.dayNumber,
          exerciseIndex: currentDayIndex,
        ),
      ),
    );
  }

  void goToNextExercise() {
    Navigator.pop(context, widget.currentExerciseIndex + 1);
  }

  String getNextExerciseName() {
    // Kiểm tra để đảm bảo chỉ số tiếp theo không vượt quá giới hạn.
    if (currentExerciseIndex + 1 <
        dummyFitnessActivities[currentDayIndex].exercises.length) {
      // Lấy tên bài tập tiếp theo
      return dummyFitnessActivities[currentDayIndex]
          .exercises[currentExerciseIndex + 1]
          .name;
    } else {
      // Hoặc trả về một chuỗi nếu đã là bài tập cuối cùng
      return "End of Exercises";
    }
  }

  // + 20s rest
  void _addTime() {
    setState(() {
      timeLeft += 20;
    });
  }

  @override
  void dispose() {
    _countDownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.infinity,
                  height: 450,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg_meditation.jpeg"),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "REST",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      Text(
                        formatDuration(timeLeft),
                        style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/clock_training.svg",
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _addTime,
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 50, 64, 75),
                                fixedSize: const Size(100, 40)),
                            child: const Text(
                              "+ 20s",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: goToNextExercise,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 50, 64, 75),
                              fixedSize: const Size(100, 40),
                            ),
                            child: const Text(
                              "Skip",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      // Định vị Positioned nếu muốn nó ở bên trong Stack
                    ],
                  ),
                ),
              ),
              // Nếu cần Positioned, đặt nó ở đây trong Stack
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "${currentExerciseIndex + 1}/${dummyFitnessActivities[currentDayIndex].exercises.length}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              getNextExerciseName(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                                            exerciseIndex:
                                                currentExerciseIndex),
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
                        ),
                        Text(
                          formatDuration(timeLeft),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          // hiển thị bài tập tiếp theo
          Expanded(
            child: dummyFitnessActivities[currentDayIndex].exercises.length >
                    currentExerciseIndex
                ? Image.asset(
                    dummyFitnessActivities[currentDayIndex]
                        .exercises[currentExerciseIndex]
                        .imgGif,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
