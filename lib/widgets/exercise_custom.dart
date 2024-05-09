import 'package:flutter/material.dart';
import 'package:yoga_app/models/exerciseBegginer.dart';
import 'package:yoga_app/screens/me/me_custom1.dart';
import 'package:yoga_app/widgets/exercise_start_custom.dart';

class TrainingExerciseCustom extends StatefulWidget {
  final String text;
  final String text1;
  final String text2;

  final List<Exercises> exercises;
  final Function(int) onTap;
  final String img;
  const TrainingExerciseCustom(
      {super.key,
      required this.text,
      required this.text1,
      required this.text2,
      required this.exercises,
      required this.onTap,
      required this.img});

  @override
  State<TrainingExerciseCustom> createState() => _TrainingExerciseCustomState();
}

class _TrainingExerciseCustomState extends State<TrainingExerciseCustom> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
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
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  background: Image.asset(
                    widget.img,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                );
              },
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
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
                        widget.text,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 30),
                      Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.text2,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              widget.text1,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ]),
                      const SizedBox(height: 10),
                      const Custom01(
                        text: "Coach voice",
                        text1: "Device TTS Engine",
                        svgImg: "assets/icons/voice.svg",
                        useSwitch: false,
                        iconData: Icons.keyboard_arrow_right_outlined,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 1,
                        color: const Color.fromARGB(255, 236, 236, 236),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              var exercise = widget.exercises[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: InkWell(
                  onTap: () => widget.onTap(index),
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
                                  fontSize: 18, fontWeight: FontWeight.w600),
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
            }, childCount: widget.exercises.length),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrainingStartCustom(
                        exercises: widget.exercises,
                        initialExerciseIndex: 0,
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
          ))
        ],
      ),
    );
  }
}
