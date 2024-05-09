import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yoga_app/models/day.dart';
import 'package:yoga_app/models/exerciseBegginer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrainingDetail extends StatefulWidget {
  final Day currentDay;
  final int exerciseIndex;

  const TrainingDetail({
    super.key,
    required this.currentDay,
    required this.exerciseIndex,
  });

  @override
  State<TrainingDetail> createState() => _TrainingDetailState();
}

class _TrainingDetailState extends State<TrainingDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int currentPageIndex;
  YoutubePlayerController? _controller;
  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.exerciseIndex;
    _tabController = TabController(length: 2, vsync: this);
    _initializeVideoController();

    _tabController.addListener(
      () {
        if (_tabController.indexIsChanging && mounted) {
          setState(
            () {
              _initializeVideoController();
            },
          );
        }
      },
    );
  }

  void _initializeVideoController() {
    String videoId =
        widget.currentDay.exercises[currentPageIndex].youtubeVideoId;

    if (_controller == null || _controller!.initialVideoId != videoId) {
      // _controller?.dispose();
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      )..addListener(() {
          if (mounted) {
            setState(() {});
          }
        });
    } else {
      _controller!.load(videoId);
    }
  }

  void _previousExercise() {
    if (currentPageIndex > 0) {
      setState(() {
        currentPageIndex--;
        _tabController.animateTo(0); // Switch to first tab
        _initializeVideoController();
      });
    }
  }

  void _nextExercise() {
    if (currentPageIndex < widget.currentDay.exercises.length - 1) {
      setState(() {
        currentPageIndex++;
        _tabController.animateTo(0); // Switch to first tab
        _initializeVideoController();
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Exercises exercise = widget.currentDay.exercises[currentPageIndex];

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.teal,
                labelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: "Animation",
                  ),
                  Tab(
                    text: "Video",
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              exercise.imgGif,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            exercise.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                "Duration",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              Text(
                                "00:${exercise.duration.toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            exercise.desc,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 125, 125, 125),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _controller != null
                              ? YoutubePlayer(
                                  controller: _controller!,
                                  showVideoProgressIndicator: true,
                                  onReady: () {},
                                )
                              : CircularProgressIndicator(),
                          const SizedBox(height: 20),
                          Text(
                            exercise.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                "Duration",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              Text(
                                "00:${exercise.duration.toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            exercise.desc,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 125, 125, 125),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed:
                          currentPageIndex > 0 ? _previousExercise : null,
                      icon: Icon(
                        Icons.arrow_circle_left_rounded,
                        size: 30,
                        color: currentPageIndex > 0 ? Colors.teal : Colors.grey,
                      ),
                    ),
                    Text(
                      "${currentPageIndex + 1}/${widget.currentDay.exercises.length}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    IconButton(
                      onPressed: currentPageIndex <
                              widget.currentDay.exercises.length - 1
                          ? _nextExercise
                          : null,
                      icon: Icon(
                        Icons.arrow_circle_right_rounded,
                        size: 30,
                        color: currentPageIndex <
                                widget.currentDay.exercises.length - 1
                            ? Colors.teal
                            : Colors.grey,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      "CLOSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
