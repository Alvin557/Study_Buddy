import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/route_const.dart';

class StudyDetailScreen extends StatelessWidget {
  StudyDetailScreen({super.key});
  final data = [
    "Design",
    "Art",
    "Design",
    "Collaboration",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, startLearningRoute),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: StudyBuddy.secondaryColor),
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: StudyBuddy.whiteColor),
            //return false when click on "NO"

            child: const Text(
              'Start Learning',
              style: TextStyle(color: StudyBuddy.primaryColor),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 251,
            padding: const EdgeInsets.all(18),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/study.jpg"))),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: StudyBuddy.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              height: MediaQuery.of(context).size.height - 320,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Exam preparation",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "By Sudip KC (Science)",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: StudyBuddy.secondaryLightColor,
                          ),
                          Text(
                            " 4.6 (100 Review)",
                            style: TextStyle(color: StudyBuddy.greyColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.play_lesson,
                                color: StudyBuddy.primaryColor,
                              ),
                              Text(" 12 Lessona"),
                            ],
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                color: StudyBuddy.secondaryColor,
                              ),
                              Text(" 12 Hours"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the"
                        "printing and typesetting industry. Lorem"
                        "Ipsum has been the industry's standard "
                        "dummy text ever since the 1500s, when an"
                        "unknown printer took a galley of type and"
                        "scrambled it to make a type specimen book.",
                        style: TextStyle(
                            fontSize: 14,
                            color: StudyBuddy.blackColor.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Wrap(
                        children: List.generate(
                            data.length,
                            (index) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: index % 2 == 0
                                        ? StudyBuddy.primaryColor
                                        : StudyBuddy.secondaryColor,
                                  ),
                                  margin: const EdgeInsets.only(
                                      right: 10, bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 27, vertical: 7),
                                  child: Text(
                                    data[index],
                                    style: const TextStyle(
                                        color: StudyBuddy.whiteColor),
                                  ),
                                )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
