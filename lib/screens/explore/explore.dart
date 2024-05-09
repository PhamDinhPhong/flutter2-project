import 'package:flutter/material.dart';
import 'package:yoga_app/data/yogaData.dart';
import 'package:yoga_app/screens/explore/explore_custom_button.dart';
import 'package:yoga_app/screens/explore/explore_custom_listView.dart';
import 'package:yoga_app/screens/explore/explore_custom_listview1.dart';
import 'package:yoga_app/screens/explore/explore_custom_listview2.dart';
import 'package:yoga_app/screens/explore/explore_custom_title.dart';
import 'package:yoga_app/screens/explore/explore_custom_video_course.dart';
import 'package:yoga_app/widgets/exercise_custom.dart';
import 'package:yoga_app/widgets/exercise_detail_custom.dart';
import 'package:yoga_app/widgets/exercise_focus_custom.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final videoURL = "https://www.youtube.com/watch?v=Xi_7G3j6aSE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomButton(
                                onPressed: () {},
                                buttonText: "Beginner",
                              ),
                              const SizedBox(width: 10),
                              CustomButton(
                                onPressed: () {},
                                buttonText: "Flexibility",
                              ),
                              const SizedBox(width: 10),
                              CustomButton(
                                onPressed: () {},
                                buttonText: "Relaxation",
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomButton(
                                onPressed: () {},
                                buttonText: "Pilates",
                              ),
                              const SizedBox(width: 10),
                              CustomButton(
                                onPressed: () {},
                                buttonText: "Meditation",
                              ),
                              const SizedBox(width: 10),
                              CustomButton(
                                onPressed: () {},
                                buttonText: "Health care",
                              ),
                              const SizedBox(width: 10),
                              CustomButton(
                                onPressed: () {},
                                buttonText: "Fat burning",
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create for you",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.5),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "assets/images/explore_create.jpg",
                              scale: 1.0,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: 200,
                            ),
                          ),
                          const Positioned(
                            top: 40,
                            left: 30,
                            child: Text(
                              "Custom workout",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 254, 247, 240),
                                  letterSpacing: -0.5),
                            ),
                          ),
                          const Positioned(
                            top: 69,
                            left: 30,
                            child: Text(
                              "Brand new workout everytime!",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 254, 247, 240),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 120,
                            left: 30,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromWidth(180),
                                foregroundColor:
                                    const Color.fromARGB(255, 225, 6, 95),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Start",
                                style: (TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 171, 58, 66),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Titlee(
                      text: "Getting started",
                      textButton: "View all >",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 260,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Card01(
                              text1: "Ease Yoga for beginners",
                              text2: "16 mins",
                              img: "assets/images/explore_getting_started1.jpg",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TrainingExerciseCustom(
                                      text: "Ease Yoga for beginners",
                                      text1:
                                          "This class will help those in the beginning stage to lay the foundations of yoga.",
                                      text2: "16 mins ● Beginner",
                                      exercises: easeYogaExplore,
                                      onTap: (index) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TrainingDetailCustom(
                                              exercises: sunriseYoga,
                                              initialExerciseIndex: index,
                                            ),
                                          ),
                                        );
                                      },
                                      img:
                                          'assets/images/explore_getting_started1.jpg',
                                    ),
                                  ),
                                );
                              },
                              widthImgSize: 300,
                              heightImgSize: 200,
                            ),
                            const SizedBox(width: 20),
                            Card01(
                              text1: "Kids Yoga",
                              text2: "11 mins",
                              img: "assets/images/kid_yoga.jpg",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TrainingExerciseCustom(
                                      text: "Kids Yoga",
                                      text1:
                                          "This fun class is a great bonding experience between parent and child while strengthening the growth of your child's muscles and mind.",
                                      text2: "11 mins ● Beginner",
                                      exercises: yogaKid,
                                      onTap: (index) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TrainingDetailCustom(
                                              exercises: yogaKid,
                                              initialExerciseIndex: index,
                                            ),
                                          ),
                                        );
                                      },
                                      img: 'assets/images/kid_yoga.jpg',
                                    ),
                                  ),
                                );
                              },
                              widthImgSize: 300,
                              heightImgSize: 200,
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                // Pilates Toning
                Column(
                  children: [
                    Titlee(
                      text: "Pilates Toning",
                      textButton: "View all >",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 320,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "15 Min Pilates - Low Impact",
                                            text1:
                                                "This low-intensity full-body workout is specifically desgined for beginners. Simple movements can activate your full-body engergy, and take your fitness and health journey to the next level!",
                                            text2: "6 mins ● Beginner",
                                            exercises: pilate1,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: pilate1,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: 'assets/images/pilates_1.jpg',
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/pilates_1.jpg",
                                    text: "15 Min Pilates - Low Impact",
                                    text1: "6 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "15 Min Flat Belly Pilates",
                                            text1:
                                                "This intermediate-level workout is specifically designed to help you achieve tight and toned bikini abs. Witness amazing results in a short period of time.",
                                            text2: "13 mins ● Imternmediate",
                                            exercises: pilate2,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: pilate2,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: 'assets/images/pilates_2.jpg',
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/pilates_2.jpg",
                                    text: "15 Min Flat Belly Pilates",
                                    text1: "13 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text:
                                                "Relaxing Pilates for WeightLoss",
                                            text1:
                                                "Want to lose weight effortlessly through gentle exercise? Come and try this beginner's Pilates workout! You can effectively lose fat and sculpt a slender figure without intense wourkouts.",
                                            text2: "13 mins ● Beginner",
                                            exercises: pilate3,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: pilate3,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/pilates_3.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/pilates_3.jpg",
                                    text: "Relaxing Pilates for WeightLoss",
                                    text1: "16 mins",
                                  )
                                ],
                              ),
                              const SizedBox(width: 30),
                              Column(
                                children: [
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Easy Pilates for Full Body",
                                            text1:
                                                "This moderate-intensity workout works effectively to lone every part of your body. Join this workout and experience gorgeous muscle transformation throughout your body!",
                                            text2: "13 mins ● Beginner",
                                            exercises: pilate3,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: pilate3,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/pilates_4.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/pilates_4.jpg",
                                    text: "Easy Pilates for Full Body",
                                    text1: "13 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Model Legs & Bubble Booty",
                                            text1:
                                                "This moderate-intensity workout works effectively to tone every part of your body. Join this workout and experience gorgeous muscle transformation throughout your body!",
                                            text2: "13 mins ● Beginner",
                                            exercises: pilate2,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: pilate2,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/pilates_5.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/pilates_5.jpg",
                                    text: "Model Legs & Bubble Booty",
                                    text1: "9 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text:
                                                "Full Body Calories-Burning Pilates",
                                            text1:
                                                "This intermediate Pilates fat-burning workout can help you build a healthy physique and unlock your fitness potential. Get readly to burn the full-body fat quickly!",
                                            text2: "23 mins ● Intermediate",
                                            exercises: pilate1,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: pilate1,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/pilates_6.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/pilates_6.jpg",
                                    text: "Full Body Calories-Burning Pilates",
                                    text1: "23 mins",
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Strength & flexibility
                Column(
                  children: [
                    Titlee(
                      text: "Strength & flexibility",
                      textButton: "View all >",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 320,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Flexibility moves",
                                            text1:
                                                "The yoga stretches twists and side opeing of this class will help you to increase your flexibilyty.",
                                            text2: "18 mins ● Intermediate",
                                            exercises: strong_1,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: strong_1,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/strong1.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/strong1.jpg",
                                    text: "Flexibility moves",
                                    text1: "18 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Improve shoulder mobility",
                                            text1:
                                                "This short session focusses on areas that get stressed during daily activities to help you combat neck tension, shoulder and upper back pain.",
                                            text2: "12 mins ● Beginner",
                                            exercises: strong_2,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: strong_2,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/strong2.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/strong2.jpg",
                                    text: "Improve shoulder mobility",
                                    text1: "12 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Lower body stretching 7 min",
                                            text1:
                                                "Help you relax and build fexlibility. It's also a good stretching routine for running and exercise.",
                                            text2: "7 mins ● 18 exercises",
                                            exercises: strong_3,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: strong_3,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/strong3.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/strong3.jpg",
                                    text: "Lower body stretching 7 min",
                                    text1: "7 mins",
                                  )
                                ],
                              ),
                              const SizedBox(width: 30),
                              Column(
                                children: [
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Splits training beginner",
                                            text1:
                                                "In this training, we will guide you to get your full splits step by step.",
                                            text2: "7 mins ● Beginner",
                                            exercises: strong_4,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: strong_4,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/strong4.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/strong4.jpg",
                                    text: "Splits training beginner",
                                    text1: "17 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text:
                                                "Lower body stretching 15 min",
                                            text1:
                                                "Help you relax and build fexlibility. It's also a good stretching routine for running and exercise.",
                                            text2: "15 mins ● 22 exercises",
                                            exercises: strong_5,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: strong_5,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/strong5.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/strong5.jpg",
                                    text: "Lower body stretching 15 min",
                                    text1: "15 mins",
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Meditation
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Titlee(
                        text: "Meditation",
                        onPressed: () {},
                        textButton: "View all >"),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 280,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              Card03(
                                img: "assets/images/meditation1.jpg",
                                text1: "5-min Daily",
                                text2: "5 min - Calm",
                                onTap: () {},
                              ),
                              const SizedBox(width: 10),
                              Card03(
                                img: "assets/images/meditation2.jpg",
                                text1: "Breath and Body Awareness",
                                text2: "5 min - Breath",
                                onTap: () {},
                              ),
                              const SizedBox(width: 10),
                              Card03(
                                img: "assets/images/meditation3.jpg",
                                text1: "The Power of Gratitude",
                                text2: "5 min - Gratitude",
                                text3: "PRO",
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // Stress relief and rel
                Column(
                  children: [
                    Titlee(
                      text: "Stress relief and rel",
                      textButton: "View all >",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 260,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card01(
                            text1: "Yin Yoga",
                            text2: "42 mins",
                            img: "assets/images/relax1.jpg",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TrainingExerciseCustom(
                                    text: "Yin Yoga",
                                    text1:
                                        "This class requires you to pay attention to your breath, thoughts and body sensations. You'll increase your inner awareness and alleviate anxiousness and stress.",
                                    text2: "42 mins ● Beginner",
                                    exercises: relax_1,
                                    onTap: (index) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingDetailCustom(
                                            exercises: relax_1,
                                            initialExerciseIndex: index,
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/strong5.jpg",
                                  ),
                                ),
                              );
                            },
                            widthImgSize: 250,
                            heightImgSize: 190,
                          ),
                          const SizedBox(width: 20),
                          Card01(
                            text1: "De-stressing time",
                            text2: "19 mins",
                            img: "assets/images/relax2.jpg",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TrainingExerciseCustom(
                                    text: "De-stressing time",
                                    text1:
                                        "This class requires you to pay attention to your breath, thoughts and body sensations. You'll increase your inner awareness and alleviate anxiousness and stress.",
                                    text2: "19 mins ● Beginner",
                                    exercises: relax_2,
                                    onTap: (index) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingDetailCustom(
                                            exercises: relax_2,
                                            initialExerciseIndex: index,
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/relax2.jpg",
                                  ),
                                ),
                              );
                            },
                            widthImgSize: 250,
                            heightImgSize: 190,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // Health care
                Column(
                  children: [
                    Titlee(
                      text: "Health care",
                      textButton: "View all >",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 320,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Heart health keeper",
                                            text1:
                                                "This class will get your body moving to increase your heart rate and pump more blood around your body. It requires some balance and yoga experience.",
                                            text2: "22 mins ● Intermediate",
                                            exercises: pilate1,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: pilate1,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/health1.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/health1.jpg",
                                    text: "Heart health keeper",
                                    text1: "22 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Bad posture correction",
                                            text1:
                                                "Get a good posture by correcting your hunched shoulders and forward head posture, allowing you to better perform your daily activites.",
                                            text2: "10 mins ● Intermediate",
                                            exercises: pilate2,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: pilate2,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/health2.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/health2.jpg",
                                    text: "Bad posture correction",
                                    text1: "10 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Detox and digestion flow",
                                            text1:
                                                "This detox yoga sequence is designed to massage the internal organs and tone the body with mindful yoga for detoxfication and digestion!",
                                            text2: "10 mins ● Intermediate",
                                            exercises: pilate2,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: pilate2,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/health3.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/health3.jpg",
                                    text: "Detox and digestion flow",
                                    text1: "16 mins",
                                  )
                                ],
                              ),
                              const SizedBox(width: 30),
                              Column(
                                children: [
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text:
                                                "Prevent & relieve sciatic pain",
                                            text1:
                                                "Gentle yoga for severe sciatic pain. No yoga enperience required.",
                                            text2: "17 mins ● Beginner",
                                            exercises: strong_1,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: strong_1,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/health4.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/health4.jpg",
                                    text: "Prevent & relieve sciatic pain",
                                    text1: "17 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Knee pain relief",
                                            text1:
                                                "Relieve pain and strengthen weak knees",
                                            text2: "10 mins ● 16 exercises",
                                            exercises: strong_2,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: strong_2,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/health5.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/health5.jpg",
                                    text: "Knee pain relief",
                                    text1: "10 mins",
                                  ),
                                  const SizedBox(height: 15),
                                  Card02(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingExerciseCustom(
                                            text: "Fix your text neck",
                                            text1:
                                                "Relieve pain and strengthen weak knees",
                                            text2: "8 mins ● Beginner",
                                            exercises: strong_3,
                                            onTap: (index) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainingDetailCustom(
                                                    exercises: strong_2,
                                                    initialExerciseIndex: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            img: "assets/images/health6.jpg",
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/health6.jpg",
                                    text: "Fix your text neck",
                                    text1: "8 mins",
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Fat burning
                Column(
                  children: [
                    Titlee(
                      text: "Fat burning",
                      textButton: "View all >",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 260,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card01(
                            text1: "Fut burner",
                            text2: "16 mins",
                            img: "assets/images/fatburn1.jpg",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TrainingExerciseCustom(
                                    text: "Fut burner",
                                    text1:
                                        "Build, trim and tone lean muscle mass with attention on alignment, action and secsation.",
                                    text2: "16 mins ● Beginner",
                                    exercises: easeYogaExplore,
                                    onTap: (index) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingDetailCustom(
                                            exercises: sunriseYoga,
                                            initialExerciseIndex: index,
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/fatburn1.jpg",
                                  ),
                                ),
                              );
                            },
                            widthImgSize: 250,
                            heightImgSize: 190,
                          ),
                          const SizedBox(width: 20),
                          Card01(
                            text1: "Killer chest workout",
                            text2: "21 mins",
                            img: "assets/images/fatburn2.jpg",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TrainingExerciseCustom(
                                    text: "Killer chest workout",
                                    text1:
                                        "Brutal workout to pump up your pecs with dumbbells.",
                                    text2: "21 mins ● Advanced",
                                    exercises: relax_1,
                                    onTap: (index) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingDetailCustom(
                                            exercises: relax_1,
                                            initialExerciseIndex: index,
                                          ),
                                        ),
                                      );
                                    },
                                    img: "assets/images/fatburn2.jpg",
                                  ),
                                ),
                              );
                            },
                            widthImgSize: 250,
                            heightImgSize: 190,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Video course",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: SizedBox(
                            height: 180,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  children: [
                                    Card04(
                                      img: "assets/images/video1.jpg",
                                      text1: "Neck & Shoulder",
                                      text2: "Pain Relief",
                                      onTap: () {},
                                    ),
                                    const SizedBox(width: 10),
                                    Card04(
                                      img: "assets/images/video2.jpg",
                                      text1: "Beginners | Easy",
                                      text2: "Basics",
                                      onTap: () {},
                                    ),
                                    const SizedBox(width: 10),
                                    Card04(
                                      img: "assets/images/video3.jpg",
                                      text1: "Relieve Lower Back",
                                      text2: "and Hip Pain",
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
