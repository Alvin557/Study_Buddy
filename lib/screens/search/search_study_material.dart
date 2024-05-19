import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_buddy/const/route_const.dart';

import '../../const/colors.dart';

class SearchStudyMaterial extends StatelessWidget {
  SearchStudyMaterial({super.key});
  final List<String> currentSessionData = [
    "Exams",
    "Projects",
    "Quizzes",
    "Essays",
    "Flashcard",
    "Notes"
  ];

  final List<String> popularData = [
    "Articles",
    "Postcards",
    "E-books",
    "Videos",
    "Infographics",
    "Webinars"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  const Flexible(
                    child: CustomTextFormField(),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 33,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Current Study Session Overview",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomGridView(currentSessionData: currentSessionData),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Explore more",
                            style: TextStyle(
                                color: StudyBuddy.greyColor, fontSize: 14),
                          ),
                          Icon(Icons.arrow_drop_down_sharp)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      "Popular Topics",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomGridView(
                      currentSessionData: popularData,
                      boolPrimaryColor: true,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomGridView extends StatelessWidget {
  final bool boolPrimaryColor;
  const CustomGridView({
    super.key,
    required this.currentSessionData,
    this.boolPrimaryColor = false,
  });

  final List<String> currentSessionData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: currentSessionData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, studyMaterialRoute);
          },
          child: Container(
            decoration: BoxDecoration(
                color: boolPrimaryColor
                    ? StudyBuddy.primaryColor
                    : StudyBuddy.whiteColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                    width: boolPrimaryColor ? 0 : 1,
                    color: StudyBuddy.greyColor)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: Text(
                currentSessionData[index],
                style: TextStyle(
                    color: boolPrimaryColor
                        ? StudyBuddy.whiteColor
                        : StudyBuddy.blackColor),
              ),
            )),
          ),
        );
      },
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search Study Material",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2EC4B6)),
            borderRadius: BorderRadius.circular(24)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffB8B8D2)),
            borderRadius: BorderRadius.circular(24)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffB8B8D2)),
            borderRadius: BorderRadius.circular(24)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffB8B8D2)),
            borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
