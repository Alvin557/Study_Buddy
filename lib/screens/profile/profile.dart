import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const/colors.dart';
import '../../const/route_const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/profile.png")),
                      color: Colors.red,
                      shape: BoxShape.circle),
                ),
                Positioned(
                  top: 80,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: StudyBuddy.greyColor),
                        shape: BoxShape.circle,
                        color: StudyBuddy.whiteColor),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit_square,
                          size: 15,
                          color: StudyBuddy.greyColor,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(auth.currentUser!.email!),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  ContainerIconText(
                    icon: Icons.menu_book_rounded,
                    text: "My Study Plans",
                    route: studyPlansRoute,
                  ),
                  ContainerIconText(
                    icon: Icons.quiz,
                    text: "My Quizzes",
                    route: takeQuizzRoute,
                  ),
                  ContainerIconText(
                    icon: Icons.crop_landscape,
                    text: "My Flashcards",
                    route: flashcardRoute,
                  ),
                  ContainerIconText(
                    icon: Icons.settings,
                    text: "Settings",
                    route: "",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: StudyBuddy.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        FirebaseAuth.instance.signOut();
                        SharedPreferences? prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("loggedIn", false);

                        if (context.mounted) {
                          Navigator.pushNamed(context, loginScreenRoute);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Log out",
                          style: TextStyle(color: StudyBuddy.whiteColor),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;
  const ContainerIconText({
    super.key,
    required this.icon,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: StudyBuddy.whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: StudyBuddy.greyColor.withOpacity(0.5), width: 1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: StudyBuddy.lightPrimary),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        color: StudyBuddy.blackColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
