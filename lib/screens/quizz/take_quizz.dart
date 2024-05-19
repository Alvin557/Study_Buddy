import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../const/colors.dart';

import 'quizz_number_provider.dart';

class TakeQuizz extends StatelessWidget {
  const TakeQuizz({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<QuizzNUmberProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Science",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Questions (1/15)",
                    style:
                        TextStyle(color: StudyBuddy.blackColor, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined),
                      Text(
                        " 20s",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        StudyBuddy.primaryColor,
                        StudyBuddy.secondaryColor,
                      ],
                    )),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
                  child: Center(
                    child: Text(
                      " What is the largest mammal? ",
                      style:
                          TextStyle(fontSize: 20, color: StudyBuddy.whiteColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const CustomAnswerCard(
                answer: "Panda",
                optionIndex: 'A',
                index: 1,
              ),
              const CustomAnswerCard(
                optionIndex: "B",
                answer: "Elephant",
                index: 2,
              ),
              const CustomAnswerCard(
                answer: "Lion",
                optionIndex: 'C',
                index: 3,
              ),
              const CustomAnswerCard(
                answer: "Tiger",
                optionIndex: 'D',
                index: 4,
              ),
              const SizedBox(
                height: 20,
              ),
              provider.clicked && provider.selectedIndex == 0
                  ? const Text(
                      "Please select any options.",
                      style: TextStyle(color: Colors.red),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    provider.changeClicked(true);

                    // ignore: unrelated_type_equality_checks
                    if (!(provider.selectedIndex == 0)) {}
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color(0xff2EC4B6)),
                  //return false when click on "NO"

                  child: const Text(
                    'Next',
                    style: TextStyle(color: Color(0xffffffff), fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAnswerCard extends StatelessWidget {
  final String answer;
  final String optionIndex;
  final int index;
  const CustomAnswerCard({
    super.key,
    required this.answer,
    required this.optionIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuizzNUmberProvider>(context);
    var width = MediaQuery.of(context).size.width;

    Color color = index == provider.selectedIndex
        ? StudyBuddy.whiteColor
        : StudyBuddy.greyColor;
    return InkWell(
      onTap: () {
        provider.changeIndex(index);
      },
      splashColor: StudyBuddy.whiteColor,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        decoration: BoxDecoration(
            color: index == provider.selectedIndex
                ? StudyBuddy.primaryColor
                : StudyBuddy.whiteColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                width: 1,
                color: index == provider.selectedIndex
                    ? StudyBuddy.whiteColor
                    : StudyBuddy.greyColor)),
        child: Row(
          children: [
            Text(
              optionIndex,
              style: TextStyle(fontSize: 20, color: color),
            ),
            const SizedBox(
              width: 14,
            ),
            Container(
              width: 2,
              height: 30,
              color: color,
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              answer,
              style: TextStyle(fontSize: 20, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
