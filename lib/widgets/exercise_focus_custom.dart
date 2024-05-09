import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/data/yogaData.dart';
import 'package:yoga_app/models/exerciseBegginer.dart';
import 'package:yoga_app/models/exercise_focus.dart';
import 'package:yoga_app/widgets/exercise_custom.dart';
import 'package:yoga_app/widgets/exercise_detail_custom.dart';

class ExerciseFocusCustom extends StatelessWidget {
  final List<ExerciseFocus> exercises;

  final String text;
  final String text1;
  final String text2;
  final String img;
  const ExerciseFocusCustom({
    super.key,
    required this.text,
    required this.text1,
    required this.text2,
    required this.img,
    required this.exercises,
  });

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
                      text,
                      style: const TextStyle(
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
                        img,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                      Positioned(
                        top: 70,
                        left: 40,
                        child: Text(
                          text1,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 40,
                        child: SizedBox(
                          width: 250,
                          child: Text(
                            text2,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
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
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                ExerciseFocus exercise = exercises[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrainingExerciseCustom(
                            text: "Sunrise Yoga",
                            text1:
                                "Wake up with energy,make your body primed for the day.",
                            text2: "5 mins ● Beginner",
                            exercises: sunriseYoga,
                            onTap: (index) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TrainingDetailCustom(
                                    exercises: sunriseYoga,
                                    initialExerciseIndex: index,
                                  ),
                                ),
                              );
                            },
                            img: 'assets/images/daily_scenery.png',
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SvgPicture.asset(
                            exercise.img1,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 280,
                              child: Text(
                                exercise.text,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              '${exercise.duration} Mins · ${exercise.level}',
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: exercises.length,
            ),
          ),
        ],
      ),
    );
  }
}
