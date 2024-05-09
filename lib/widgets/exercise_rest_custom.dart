import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/models/exerciseBegginer.dart';
import 'package:yoga_app/widgets/exercise_detail_custom.dart';
import 'package:yoga_app/widgets/exercise_start_custom.dart';

class TrainingRestCustom extends StatefulWidget {
  final List<Exercises> exercises;
  final int currentExerciseIndex;
  const TrainingRestCustom(
      {super.key, required this.exercises, required this.currentExerciseIndex});

  @override
  State<TrainingRestCustom> createState() => _TrainingRestCustomState();
}

class _TrainingRestCustomState extends State<TrainingRestCustom> {
  int timeLeft = 30;
  Timer? _countDownTimer;
  int currentDayIndex = 0;
  int currentExerciseIndex = 0;

  @override
  void initState() {
    super.initState();
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
        builder: (context) => TrainingStartCustom(
          exercises: widget.exercises, // sử dụng thuộc tính từ widget
          initialExerciseIndex:
              currentExerciseIndex, // số thứ tự bài tập hiện tạ
        ),
      ),
    );
  }

  void goToNextExercise() {
    Navigator.pop(context, widget.currentExerciseIndex + 1);
  }

  String getNextExerciseName() {
    // Kiểm tra để đảm bảo chỉ số tiếp theo không vượt quá giới hạn.
    if (currentExerciseIndex + 1 < widget.exercises.length) {
      // Lấy tên bài tập tiếp theo
      return widget.exercises[currentExerciseIndex + 1].name;
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
                          "${currentExerciseIndex + 1}/${widget.exercises.length}",
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
                                        builder: (context) =>
                                            TrainingDetailCustom(
                                          exercises: widget.exercises,
                                          initialExerciseIndex:
                                              currentExerciseIndex,
                                        ),
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
          Expanded(
            child: widget.exercises.length > currentExerciseIndex
                ? Image.asset(
                    widget.exercises[currentExerciseIndex].imgGif,
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
