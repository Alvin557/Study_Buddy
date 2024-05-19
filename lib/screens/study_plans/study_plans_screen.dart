import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../const/colors.dart';
import '../../const/route_const.dart';

class StudyPlansScreen extends StatelessWidget {
  StudyPlansScreen({super.key});

  final List<Map<String, dynamic>> studyPlans = [
    {
      "title": "Quizlets",
      "time": "9:00 to 12:00",
      "progress": 75,
      "isFavorite": true
    },
    {
      "title": "Science",
      "time": "14:00 to 16:00",
      "progress": 50,
      "isFavorite": false
    },
    {
      "title": "Essay",
      "time": "12:00 to 13:00",
      "progress": 10,
      "isFavorite": true
    },
    {
      "title": "Projects",
      "time": "20:00 to 22:00",
      "progress": 85,
      "isFavorite": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    CollectionReference studyPlans =
        FirebaseFirestore.instance.collection("study_plans");
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: StudyBuddy.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: () {
            Navigator.pushNamed(context, addStudyPlansRoute);
          },
          child: const Icon(
            Icons.add,
            color: StudyBuddy.whiteColor,
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          title: Center(
            child: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "Study",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000))),
              TextSpan(
                  text: "Plans",
                  style: TextStyle(fontSize: 24, color: Color(0xff000000)))
            ])),
          ),
          excludeHeaderSemantics: false,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, searchStudyMaterial);
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
                      Icons.search,
                      size: 20,
                      color: Color(0xffffffff),
                    )),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
              stream: studyPlans.snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Align(
                      alignment: Alignment.center,
                      child: LoadingAnimationWidget.waveDots(
                          color: StudyBuddy.primaryColor, size: 33.sp),
                    );
                  case ConnectionState.active:
                    final listOfData = snapshot.data!.docs;

                    return Column(
                      children: List.generate(listOfData.length, (index) {
                        final data = listOfData[index];
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xff919191),
                                  blurRadius: 10,
                                  spreadRadius: -6,
                                  offset: Offset(3, 4),
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 108.h,
                                width: 108.w,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/study.jpg')),
                                    borderRadius: BorderRadius.circular(24)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    data['title'][0].toUpperCase() +
                                        data['title'].substring(1),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    '${data['startTime']} to ${data['endTime']} ',
                                    style: const TextStyle(
                                        color: StudyBuddy.greyColor),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "${data['progress']}%",
                                        style: const TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    const TextSpan(
                                        text: " complete",
                                        style: TextStyle(
                                          color: Color(0xff919191),
                                        )),
                                  ])),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    height: 6,
                                    width: 120.w,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      child: LinearProgressIndicator(
                                        value: data['progress'] / 100,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Color(0xffFFBF69)),
                                        backgroundColor:
                                            const Color(0xffCBF3F0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  studyPlans
                                      .doc(snapshot.data!.docs[index].id)
                                      .update(
                                          {"isFavorite": !data["isFavorite"]});
                                },
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: data["isFavorite"]
                                          ? StudyBuddy.lightPrimary
                                          : const Color(0xffffffff),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xff919191),
                                          blurRadius: 10,
                                          spreadRadius: -6,
                                          offset: Offset(3, 4),
                                        ),
                                      ]),
                                  child: const Icon(
                                    Icons.favorite_border,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    );
                  default:
                }
                return const SizedBox();
              }),
        ));
  }
}
