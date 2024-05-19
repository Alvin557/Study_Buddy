import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../const/colors.dart';
import '../../const/route_const.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> quizzData = [
    {
      "heading": "Daily Quizz",
      "questions": "10 Questions",
      "category": "2 Categories"
    },
    {
      "heading": "Added Quizz",
      "questions": "12 Questions",
      "category": "6 Categories"
    },
    {
      "heading": "Expert Quizz",
      "questions": "20 Questions",
      "category": "5 Categories"
    }
  ];

  final List<Map<String, String>> flashCardDatt = [
    {
      "heading": "Daily Flashcard",
      "flashcard": "10 flashcard",
    },
    {
      "heading": "Added Flashcard",
      "flashcard": "5 flashcard",
    },
    {
      "heading": "Weekely Flashcard",
      "flashcard": "15 flashcard",
    }
  ];

  final List<Map<String, String>> subject = [
    {
      "name": "Mathmatic",
      "assets": "assets/images/math.png",
    },
    {
      "name": "Science",
      "assets": "assets/images/science.png",
    },
    {
      "name": "History",
      "assets": "assets/images/history.png",
    },
    {
      "name": "Computer",
      "assets": "assets/images/computer.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarX(
        controller: SidebarXController(selectedIndex: 0, extended: true),
      ),
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
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
        excludeHeaderSemantics: false,
        actions: [
          InkWell(
            onTap: () async {
              if (context.mounted) {
                Navigator.pushNamed(context, profileScreenRoute);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Container(
                  height: 36,
                  width: 36,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: StudyBuddy.secondaryLightColor),
                  child: const Icon(
                    Icons.person,
                    size: 20,
                    color: Color(0xffffffff),
                  )),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffffffff),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff919191),
                      blurRadius: 10,
                      spreadRadius: -6,
                      offset: Offset(3, 4),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Current Study Session"),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, studyPlansRoute);
                        },
                        child: const Text(
                          "My sessions",
                          style: TextStyle(color: Color(0xff2EC4B6)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: "75%",
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: " complete",
                        style: TextStyle(
                          color: Color(0xff919191),
                        )),
                  ])),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 6,
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xffFFBF69)),
                        backgroundColor: Color(0xffCBF3F0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const HeadingQuizzFlashCard(
            title: "Quizz",
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 14.0),
              child: Row(
                  children: List.generate(quizzData.length, (index) {
                final data = quizzData[index];
                return InkWell(
                  onTap: () => Navigator.pushNamed(context, takeQuizzRoute),
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.symmetric(
                        vertical: 22, horizontal: 15),
                    decoration: BoxDecoration(
                        color: index % 2 != 0
                            ? const Color(0xffFF9F1C)
                            : const Color(0xff2EC4B6),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["heading"]!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: StudyBuddy.lightPrimary),
                              child: Text(
                                data["questions"]!,
                                style: const TextStyle(
                                    color: StudyBuddy.blackColor),
                              ),
                            ),
                            const SizedBox(
                              width: 28,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: StudyBuddy.lightPrimary),
                              child: Text(
                                data["category"]!,
                                style: const TextStyle(
                                    color: StudyBuddy.blackColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, addQuizzRoute),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: StudyBuddy.lightPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Add quizzes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff000000)),
                  )),
            ),
          ),
          const HeadingQuizzFlashCard(
            title: "Flash Cards",
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 14.0),
              child: Row(
                  children: List.generate(flashCardDatt.length, (index) {
                final data = flashCardDatt[index];
                return InkWell(
                  onTap: () => Navigator.pushNamed(context, flashcardRoute),
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.symmetric(
                        vertical: 22, horizontal: 15),
                    decoration: BoxDecoration(
                        color: index % 2 != 0
                            ? StudyBuddy.secondaryLightColor
                            : StudyBuddy.lightPrimary,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["heading"]!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: StudyBuddy.primaryColor),
                              child: Text(
                                data["flashcard"]!,
                                style: const TextStyle(
                                    color: StudyBuddy.whiteColor),
                              ),
                            ),
                            const SizedBox(
                              width: 164,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, addFlashcardRoute),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: StudyBuddy.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "Add Flashcard",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff000000)),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWithoutIcon(
                      title: "Study Planner",
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 16),
                      child: Row(
                        children: List.generate(
                            10,
                            (index) => Container(
                                  height: 234,
                                  width: 288,
                                  margin: const EdgeInsets.only(right: 14),
                                  padding: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                          color: StudyBuddy.greyColor
                                              .withOpacity(0.3))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                              width: 272,
                                              height: 112,
                                              decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/images/study.jpg')),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                          Positioned(
                                            top: 88,
                                            left: 37,
                                            child: SizedBox(
                                              width: 151,
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: () =>
                                                    Navigator.pushNamed(context,
                                                        studyDetailsRoute),
                                                style: ElevatedButton.styleFrom(
                                                    alignment: Alignment
                                                        .centerLeft,
                                                    backgroundColor:
                                                        StudyBuddy.primaryColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24))),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 12,
                                                    ),
                                                    Image.asset(
                                                        height: 24,
                                                        "assets/images/person.png"),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      "Study",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffffffff),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 33,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 37),
                                          child: Text(
                                            "Exam Preparation",
                                            style: TextStyle(fontSize: 16),
                                          )),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 37.0, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/notification.png",
                                                  height: 16,
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                const Text("Set")
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/star.png",
                                                  height: 16,
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                const Text("Track")
                                              ],
                                            ),
                                            SizedBox(
                                              height: 28,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              StudyBuddy
                                                                  .primaryColor),
                                                  child: const Text(
                                                    "Start",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffffffff)),
                                                  )),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: HeaderWithoutIcon(title: "Subjects"),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20),
                        child: Row(
                          children: List.generate(
                              subject.length,
                              (index) => Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.only(
                                    left: 32,
                                    right: 32,
                                    top: 25,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: index % 2 == 0
                                          ? StudyBuddy.lightPrimary
                                          : StudyBuddy.secondaryLightColor),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          height: 24,
                                          subject[index]["assets"]!),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 9.0, bottom: 25),
                                        child: Text(subject[index]["name"]!),
                                      )
                                    ],
                                  ))),
                        ),
                      )),
                ],
              )
            ],
          ),
        ],
      ))),
    );
  }
}

class HeaderWithoutIcon extends StatelessWidget {
  final String? title;
  const HeaderWithoutIcon({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: const TextStyle(
          color: Color(0xff000000), fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}

class HeadingQuizzFlashCard extends StatelessWidget {
  final String? title;
  const HeadingQuizzFlashCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/bx_timer.png",
                height: 32,
              ),
              const SizedBox(
                width: 9,
              ),
              Text(title!)
            ],
          ),
          const Text(
            "View All",
            style: TextStyle(color: StudyBuddy.primaryColor),
          )
        ],
      ),
    );
  }
}
