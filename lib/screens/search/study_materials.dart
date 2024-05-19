import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../const/colors.dart';

class StudyMaterial extends StatelessWidget {
  const StudyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Article"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
          child: MasonryGridView.count(
            itemCount: 20,
            crossAxisCount: 2,
            mainAxisSpacing: 13,
            crossAxisSpacing: 13,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return index % 3 == 0
                  ? const CustomContainer(
                      height: 62, image: "assets/images/images.png")
                  : const CustomContainer(
                      height: 103,
                      image: "assets/images/study.jpg",
                    );
            },
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final double height;
  final String image;
  const CustomContainer({
    super.key,
    required this.height,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: StudyBuddy.greyColor),
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    )),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Learn react Js in 30 day",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10.w),
                ),
                Text(
                  "By Sudip KC",
                  style: TextStyle(
                      fontSize: 8.h,
                      color: StudyBuddy.blackColor.withOpacity(0.5)),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.play_circle,
                      size: 15,
                    ),
                    Text(
                      "12 Lessons",
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.person,
                      size: 15,
                    ),
                    Text("12")
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
