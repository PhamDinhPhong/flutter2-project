import 'package:flutter/material.dart';
import 'package:yoga_app/models/day.dart';
import 'package:yoga_app/screens/training/training_exercise.dart';

class TrainingSchedule extends StatefulWidget {
  final Day day;
  const TrainingSchedule({Key? key, required this.day}) : super(key: key);
  @override
  State<TrainingSchedule> createState() => _TrainingScheduleState();
}

class _TrainingScheduleState extends State<TrainingSchedule> {
  int daysCompleted = 0;
  int completedTasks = 0;
  final int totalDays = 30;

  // void _saveData(int daysCompleted) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('daysCompleted', daysCompleted);
  // }

  // void _loadData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     daysCompleted = prefs.getInt('daysCompleted') ?? 0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: Colors.teal,
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
                      Positioned(
                        top: 125,
                        left: 30,
                        child: SizedBox(
                          height: 6,
                          width: 170,
                          child: LinearProgressIndicator(
                            value: daysCompleted / totalDays,
                            backgroundColor:
                                const Color.fromARGB(255, 173, 45, 45),
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.blue),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 135,
                        left: 30,
                        child: Text(
                          '${totalDays - daysCompleted} days left',
                          style: const TextStyle(fontSize: 14),
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
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                int weekNumber = (index ~/ 7) + 1;
                int dayNumber = (index % 7) + 1;
                int displayDayNumber = index + 1;
                return Column(
                  children: [
                    if (dayNumber == 1)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 30, right: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.green),
                              ),
                              child: const Icon(Icons.flag, color: Colors.blue),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Week $weekNumber",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            const Text(
                              "0/7",
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: InkWell(
                        onTap: () {
                          // print('Bạn đã chọn ngày: $displayDayNumber');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainingExercise(
                                dayNumber: displayDayNumber,
                                exerciseIndex: index,
                              ),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(40),
                        child: Ink(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 229, 229, 229),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Day $displayDayNumber",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    value: daysCompleted / totalDays,
                                    backgroundColor: const Color.fromARGB(
                                        255, 210, 210, 210),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.blue),
                                  ),
                                  Text(
                                    "${(daysCompleted / totalDays * 100).toStringAsFixed(0)}%",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: 14,
            ),
          ),
        ],
      ),
    );
  }
}
