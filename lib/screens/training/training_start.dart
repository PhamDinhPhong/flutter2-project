import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/data/yogaData.dart';
import 'package:yoga_app/models/exerciseBegginer.dart';
import 'package:yoga_app/screens/training/training_exercise_detail.dart';
import 'package:yoga_app/screens/training/training_pause.dart';
import 'package:yoga_app/screens/training/training_rest.dart';

class TrainingStart extends StatefulWidget {
  final int dayNumber;
  final int exerciseIndex;
  const TrainingStart(
      {super.key, required this.dayNumber, required this.exerciseIndex});

  @override
  State<TrainingStart> createState() => _TrainingStartState();
}

class _TrainingStartState extends State<TrainingStart>
    with SingleTickerProviderStateMixin {
  int daysCompleted = 0;
  final int totalDays = 30;
  int timeCount = 0;
  Timer? _timer;
  int timeLeft = 30;
  int currentDayIndex = 0;
  int currentExerciseIndex = 0;
  late AnimationController controller;
  bool isCountdownComplete = false;
  late int _currentDuration;
  final Exercises currentExercise = dummyFitnessActivities[0].exercises[0];
  bool _isControllerDisposed = false;

  // reset time exercise
  int initialTimeCount = 0;
  @override
  void initState() {
    super.initState();
    currentExerciseIndex = widget.exerciseIndex;
    currentDayIndex = widget.dayNumber - 1;
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: timeLeft),
    )..addListener(() {
        setState(() {
          timeLeft = (controller.duration! * (1 - controller.value)).inSeconds;
          if (controller.isCompleted) {
            isCountdownComplete = true;
          }
        });
        if (controller.isCompleted) {
          setState(() {});
        }
      });

    controller.forward();
    _startCountUp();
    _currentDuration = currentExercise.duration;
    _startTimer();
    // initialTimeCount tại đây khi bắt đầu bài tập
    initialTimeCount = timeCount;
  }

  void _startCountUp() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          timeCount++;
        });
      }
    });
  }

  String formatDuration(int seconds) {
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  String _formatDuration(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;

    String formattedTime =
        "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    return formattedTime;
  }

  void _navigateToRestScreen() async {
    // Xử lý người dùng muốn chuyển sang màn hình rest
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainingRest(
          currentExerciseIndex: currentExerciseIndex,
          dayNumber: widget.dayNumber,
        ),
      ),
    );

    if (result != null && mounted) {
      setState(
        () {
          currentExerciseIndex = result as int;
          _currentDuration = dummyFitnessActivities[currentDayIndex]
              .exercises[currentExerciseIndex]
              .duration;
          _startTimer();
        },
      );
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentDuration > 0) {
          _currentDuration--;
        }
        timeCount++;
      });
      if (_currentDuration <= 0) {
        _timer?.cancel();
        // Khi hết thời gian, chuyển sang màn hình nghỉ hoặc kết thúc session
        _completeCurrentExercise();
      }
    });
  }

  void _completeCurrentExercise() {
    controller.dispose();
    _timer?.cancel();
    if (currentExerciseIndex ==
        dummyFitnessActivities[currentDayIndex].exercises.length - 1) {
      Navigator.pop(context, true);
    } else {
      _navigateToRestScreen();
    }
  }

// Hàm để quay lại bài tập trước
  void goToPreviousExercise() {
    setState(() {
      if (currentExerciseIndex > 0) {
        currentExerciseIndex--;
      }
    });
  }

  // Nếu bài tập là đầu tiên sẽ trả màu khác
  Color getColorForPrevious() {
    if (currentExerciseIndex == 0) {
      return Colors.grey;
    } else {
      return Colors.black;
    }
  }

  void _nextExercise() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainingRest(
          currentExerciseIndex: currentExerciseIndex,
          dayNumber: widget.dayNumber,
        ),
      ),
    );
    if (result != null && mounted) {
      int newIndex = result as int;
      if (newIndex >= 0 &&
          newIndex < dummyFitnessActivities[currentDayIndex].exercises.length) {
        setState(() {
          currentExerciseIndex = newIndex;
          _currentDuration = dummyFitnessActivities[currentDayIndex]
              .exercises[currentExerciseIndex]
              .duration;
          _timer?.cancel(); // Hủy timer cũ
          _startTimer(); // Khởi chạy timer mới
        });
      } else {
        print("Index out of range: $newIndex");
      }
    }
  }

  // Reset time this exercise
  void _resetCurrentExercise() {
    setState(() {
      _currentDuration = currentExercise.duration;
      timeCount = initialTimeCount; // Reset về thời điểm bắt đầu bài tập
    });
    _timer?.cancel();
    _startTimer();
  }

  void _navigateToPauseScreen() async {
    if (!_isControllerDisposed) {
      controller.stop();
    }
    _timer?.cancel();
    // Lưu lại thời gian còn lại và thời gian đã trôi qua
    final remainingTime = timeLeft;
    final elapsedTime = timeCount;

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainingPause(
          currentDayIndex: currentDayIndex,
          currentExerciseIndex: currentExerciseIndex,
        ),
      ),
    );

    // Sau khi quay lại từ pause, khởi động lại timers
    if (!mounted) return;

    controller.duration = Duration(seconds: remainingTime);
    controller.forward(from: controller.value);
    setState(() {
      timeCount = elapsedTime;
      _startTimer(); // Đặt lại thời gian lên để tiếp tục đếm
    });

    if (result == 'restart' && mounted) {
      _resetCurrentExercise();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();

    if (!_isControllerDisposed) {
      // controller.dispose();
      _isControllerDisposed = true;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentDayData = dummyFitnessActivities[currentDayIndex];
    var currentExercise = currentDayData.exercises[currentExerciseIndex];
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Image.asset(
                currentExercise.imgGif,
                height: 350,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              SafeArea(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: kToolbarHeight,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const BackButton(),
                          Text(
                            "${currentExerciseIndex + 1}/${dummyFitnessActivities[currentDayIndex].exercises.length}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    "assets/icons/sound_training_start.svg",
                                    width: 30,
                                    height: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    "assets/icons/zoom.svg",
                                    width: 30,
                                    height: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Text(_formatDuration(timeCount),
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      const Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/icons/like.svg",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/icons/dislike.svg",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 8,
                  child: LinearProgressIndicator(
                    value: daysCompleted / totalDays.toDouble(),
                    backgroundColor: const Color.fromARGB(255, 173, 45, 45),
                    valueColor: const AlwaysStoppedAnimation(Colors.blue),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrainingDetail(
                                    currentDay:
                                        dummyFitnessActivities[currentDayIndex],
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
                ),
                timeLeft > 0 && !isCountdownComplete
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Ready to go!",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            currentExercise.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 147, 179, 199),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: CircularProgressIndicator(
                                      value: controller.value,
                                      strokeWidth: 8,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    timeLeft.toString(),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(
                                    Icons.keyboard_arrow_right_rounded),
                                onPressed: () {
                                  controller.stop();
                                  setState(() {
                                    isCountdownComplete = true;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            currentExercise.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            formatDuration(_currentDuration),
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 226, 233, 241),
                                borderRadius: BorderRadius.circular(25)),
                            width: 300,
                            height: 60,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: _navigateToPauseScreen,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/pause.svg",
                                      width: 30,
                                      height: 30,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.black, BlendMode.srcIn),
                                    ),
                                    const SizedBox(width: 20),
                                    const Text(
                                      "Pause",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: currentExerciseIndex > 0
                                          ? goToPreviousExercise
                                          : null,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/previous.svg",
                                            width: 35,
                                            height: 35,
                                            colorFilter: ColorFilter.mode(
                                                getColorForPrevious(),
                                                BlendMode.srcIn),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            "Previous",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: getColorForPrevious()),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    const Text(
                                      '|',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 50),
                                    InkWell(
                                      onTap: currentExerciseIndex <
                                              dummyFitnessActivities[
                                                          currentDayIndex]
                                                      .exercises
                                                      .length -
                                                  1
                                          ? _nextExercise
                                          : null,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/next.svg",
                                            width: 25,
                                            height: 25,
                                            color: currentExerciseIndex <
                                                    dummyFitnessActivities[
                                                                currentDayIndex]
                                                            .exercises
                                                            .length -
                                                        1
                                                ? null
                                                : Colors.grey,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            "Next",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: currentExerciseIndex <
                                                      dummyFitnessActivities[
                                                                  currentDayIndex]
                                                              .exercises
                                                              .length -
                                                          1
                                                  ? null
                                                  : Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
