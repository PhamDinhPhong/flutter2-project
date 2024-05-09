import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/data/yogaData.dart';
import 'package:yoga_app/models/day.dart';
import 'package:yoga_app/models/exerciseBegginer.dart';
import 'package:yoga_app/screens/me/me_custom1.dart';
import 'package:yoga_app/screens/training/training_exercise_detail.dart';
import 'package:yoga_app/screens/training/training_start.dart';

class TrainingExercise extends StatefulWidget {
  final int dayNumber;
  final int exerciseIndex; // Thêm biến mới để truyền chỉ số của bài tập

  const TrainingExercise(
      {Key? key, required this.dayNumber, required this.exerciseIndex})
      : super(key: key);

  @override
  State<TrainingExercise> createState() => _TrainingExerciseState();
}

class _TrainingExerciseState extends State<TrainingExercise> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    int displayDayNumber = widget.dayNumber;
    // Lấy dữ liệu cho ngày hiện tại từ danh sách dummyFitnessActivities
    Day currentDayData = dummyFitnessActivities.firstWhere(
      (day) => day.id == 'day${widget.dayNumber}',
      orElse: () => Day(id: 'day${widget.dayNumber}', exercises: []),
    );
    // Kiểm tra xem ngày hiện tại có bài tập không, nếu không thì hiển thị thông báo
    bool hasExercises = currentDayData.exercises.isNotEmpty;
    var current = currentDayData.exercises.length;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: Colors.red,
            expandedHeight: 200.0,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double maxHeight = constraints.biggest.height;
                double titleOpacity =
                    1 - (maxHeight - kToolbarHeight) / (200.0 - kToolbarHeight);
                return FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: const EdgeInsets.only(left: 60, bottom: 16),
                  title: Opacity(
                    opacity: titleOpacity.clamp(0.0, 1.0),
                    child: const Text(
                      'Beginner Plan',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/begginerPlan.png',
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                      const Positioned(
                        top: 90,
                        left: 30,
                        child: Text(
                          'Beginner Plan',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Day $displayDayNumber",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "9 mins ● 9 exercises",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 126, 126, 126),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Column(children: [
                        Row(
                          children: [
                            const Text(
                              "Instruction",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                icon: Icon(
                                  isExpanded
                                      ? Icons.arrow_drop_up_rounded
                                      : Icons.arrow_drop_down_rounded,
                                  size: 30,
                                ))
                          ],
                        ),
                      ]),
                      AnimatedCrossFade(
                        firstChild: const Text(
                          "The daily exercise of this plan lasts 7- 8 minutes, especially for beginners to practice yoga from 0...",
                          style: TextStyle(
                              color: Color.fromARGB(255, 138, 138, 138),
                              fontSize: 15),
                        ),
                        secondChild: const Column(
                          children: [
                            Text(
                              "The daily exercise of this plan lasts 7- 8 minutes, especially for beginners to practice yoga from 0.",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 138, 138, 138),
                                  fontSize: 15),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "In this plan, your muscles will be activated through the basic yoga poses, and the fat-burning process will kick in. Stick to it to boost your metabolism, lose weight and get in shape.",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 138, 138, 138),
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                      const SizedBox(height: 20),
                      const Custom01(
                        text: "Coach voice",
                        text1: "Device TTS Engine",
                        svgImg: "assets/icons/voice.svg",
                        useSwitch: false,
                        iconData: Icons.keyboard_arrow_right_outlined,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text(
                            "Exercises",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/icons/coffee.svg",
                              width: 30,
                              height: 30,
                              color: const Color.fromARGB(255, 126, 126, 126),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/icons/pencil_nobg.svg",
                              width: 30,
                              height: 30,
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Nếu ngày đó không có bài tập, hiển thị thông báo
                if (!hasExercises) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        "Không có bài tập",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                } else {
                  // Xây dựng UI cho từng bài tập có trong currentDayData
                  Exercises exercise = currentDayData.exercises[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrainingDetail(
                                    currentDay: currentDayData,
                                    exerciseIndex: index,
                                  )),
                        );
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              exercise.imgGif,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(width: 25),
                          SizedBox(
                            width: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exercise.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                  softWrap: true,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "00:${exercise.duration.toString().padLeft(2, '0')}",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
              childCount: hasExercises ? current : 1,
            ),
          ),
          SliverToBoxAdapter(
            child: hasExercises
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainingStart(
                                dayNumber: widget.dayNumber,
                                exerciseIndex: widget.exerciseIndex,
                              ),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
