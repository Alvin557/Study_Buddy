import 'package:flutter/material.dart';
import '../../const/colors.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: "Group",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000))),
            TextSpan(
                text: "Study",
                style: TextStyle(fontSize: 24, color: Color(0xff000000)))
          ])),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 35),
                child: Column(
                  children: [
                    HeadingGroup(title: "Pinned", actionTitle: "Edit"),
                    SizedBox(
                      height: 16,
                    ),
                    CustomGroupCard(
                      headingTitle: "Engineering Fundamentals",
                      subHeadingTitle: "Updated about 2 months ago",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomGroupCard(
                      headingTitle: "Humanities Fundamentals",
                      subHeadingTitle: "Updated about 1 months ago",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    HeadingGroup(
                        title: "Group you manage", actionTitle: "View All"),
                    SizedBox(
                      height: 16,
                    ),
                    CustomGroupCard(
                      headingTitle: "MBBS",
                      subHeadingTitle: "Updated about 2 hours ago",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomGroupCard(
                      headingTitle: "Social Studies",
                      subHeadingTitle: "Updated about 1 months ago",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    HeadingGroup(
                        title: "Group you've joined", actionTitle: "View All"),
                    SizedBox(
                      height: 16,
                    ),
                    CustomGroupCard(
                      headingTitle: "Python Programming Fundamentals",
                      subHeadingTitle: "Updated about 2 years ago",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomGroupCard(
                      headingTitle: "Cognitive Learnings",
                      subHeadingTitle: "Updated about 2 months ago",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomGroupCard(
                      headingTitle: "Engineering Fundamentals",
                      subHeadingTitle: "Updated about 2 months ago",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    HeadingGroup(title: "Suggested for you", actionTitle: ""),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        CustomContainer(),
                        SizedBox(
                          width: 10,
                        ),
                        CustomContainer(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: StudyBuddy.greyColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 147,
            height: 71,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/study.jpg"))),
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            "Union of developers",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: StudyBuddy.blackColor),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text("Computer Science",
              style: TextStyle(fontSize: 14, color: Color(0xff000000))),
          const Text("100 members ",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: StudyBuddy.greyColor)),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 147,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: StudyBuddy.secondaryColor),
                onPressed: () {},
                child: const Text(
                  "Join",
                  style: TextStyle(color: StudyBuddy.whiteColor),
                )),
          ),
          const SizedBox(
            height: 7,
          )
        ],
      ),
    );
  }
}

class CustomGroupCard extends StatelessWidget {
  final String imageAssets;
  final String headingTitle;
  final String subHeadingTitle;
  const CustomGroupCard({
    super.key,
    this.imageAssets = "assets/images/study.jpg",
    required this.headingTitle,
    required this.subHeadingTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 37,
          width: 37,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/study.jpg')),
              borderRadius: BorderRadius.circular(8)),
        ),
        const SizedBox(
          width: 17,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headingTitle,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(subHeadingTitle,
                style:
                    const TextStyle(fontSize: 12, color: StudyBuddy.greyColor))
          ],
        )
      ],
    );
  }
}

class HeadingGroup extends StatelessWidget {
  final String title;
  final String actionTitle;
  const HeadingGroup({
    super.key,
    required this.title,
    required this.actionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          actionTitle,
          style: const TextStyle(color: StudyBuddy.primaryColor, fontSize: 14),
        )
      ],
    );
  }
}
