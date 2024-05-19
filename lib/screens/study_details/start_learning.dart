import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/const/colors.dart';
import 'package:video_player/video_player.dart';

class StartLearning extends StatefulWidget {
  const StartLearning({super.key});

  @override
  State<StartLearning> createState() => _StartLearningState();
}

class _StartLearningState extends State<StartLearning> {
  List<Map<String, dynamic>> courseContent = [
    {
      "isRead": true,
      "title": "Introduction to python programming.",
      "time": "0.2 min"
    },
    {"isRead": true, "title": "Data types", "time": "20 min"},
    {"isRead": false, "title": "String literals", "time": "15 min"},
    {"isRead": false, "title": "Constructor", "time": "20 min"},
  ];
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.asset("assets/videos/test.mp4"));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: "Study",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000))),
            TextSpan(
                text: "Buddy",
                style: TextStyle(fontSize: 24, color: Color(0xff000000)))
          ])),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlickVideoPlayer(flickManager: flickManager),
          const SizedBox(
            height: 14,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Exam Preparation",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem ..",
                      style:
                          TextStyle(fontSize: 16, color: StudyBuddy.greyColor),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Content",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    SingleChildScrollView(
                      child: Column(
                          children: List.generate(
                        courseContent.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: courseContent[index]['isRead']
                                  ? StudyBuddy.primaryColor
                                  : StudyBuddy.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      StudyBuddy.primaryColor.withOpacity(0.5),
                                  width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_circle_filled_outlined,
                                      size: 50,
                                      color: courseContent[index]['isRead']
                                          ? StudyBuddy.whiteColor
                                          : StudyBuddy.primaryColor
                                              .withOpacity(0.7),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          courseContent[index]['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: courseContent[index]
                                                      ['isRead']
                                                  ? StudyBuddy.whiteColor
                                                  : StudyBuddy.primaryColor),
                                        ),
                                        Text(
                                          courseContent[index]['time'],
                                          style: TextStyle(
                                              color: courseContent[index]
                                                      ['isRead']
                                                  ? StudyBuddy.whiteColor
                                                  : StudyBuddy.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
