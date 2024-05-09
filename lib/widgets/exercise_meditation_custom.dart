import 'package:flutter/material.dart';
import 'package:yoga_app/screens/explore/explore_custom_listview2.dart';

class MeditationExerciseCustom extends StatefulWidget {
  final String text;
  final String img;
  const MeditationExerciseCustom(
      {super.key, required this.text, required this.img});

  @override
  State<MeditationExerciseCustom> createState() =>
      _MeditationExerciseCustomState();
}

class _MeditationExerciseCustomState extends State<MeditationExerciseCustom> {
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
              delegate: SliverChildListDelegate([
            Column(
              children: [
                Card03(
                  img: "assets/images/focus_arm.jpg",
                  text1: "5-min Daily",
                  text2: "5 min - Calm",
                  onTap: () {},
                ),
              ],
            )
          ]))
        ],
      ),
    );
  }
}
