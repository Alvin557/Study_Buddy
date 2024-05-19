import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../const/colors.dart';

class Flashcards extends StatefulWidget {
  const Flashcards({super.key});

  @override
  State<Flashcards> createState() => _FlashcardsState();
}

class _FlashcardsState extends State<Flashcards> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> flashCard = [
    {
      "title": "Literals",
      "description":
          "Literals are the fixed values constants used in a sourcecode. Python supports differenttype of literals.",
      "favorite": true
    },
    {
      "title": "Smile",
      "description":
          "A comparision between two thigs or idea using “like” or “as” to emphazie similarities",
      "favorite": false
    },
    {"title": "Test", "description": "", "favorite": false},
    {"title": "Test", "description": "", "favorite": true}
  ];

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    DocumentReference<Map<String, dynamic>> reference = FirebaseFirestore
        .instance
        .collection('flashcard')
        .doc(auth.currentUser!.uid);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flashcards"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
            future: reference.collection("individualFlashCard").get(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Align(
                    alignment: Alignment.center,
                    child: LoadingAnimationWidget.waveDots(
                        color: StudyBuddy.primaryColor, size: 33.sp),
                  );
                case ConnectionState.done:
                  final data = snapshot.data!.docs;
                  return Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                          child: Text(
                        "${currentIndex + 1} of ${data.length}",
                        style: const TextStyle(fontSize: 16),
                      )),
                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                StudyBuddy.lightPrimary,
                                StudyBuddy.secondaryLightColor,
                              ],
                            )),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomIcon(
                                  left: 14,
                                  isFavorite: data[currentIndex]['favorite'],
                                ),
                                const CustomIcon(
                                  right: 14,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Text(
                              data[currentIndex]['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 29.0, vertical: 30),
                              child: Text(
                                data[currentIndex]['description'],
                                style: const TextStyle(
                                    fontSize: 20, color: StudyBuddy.blackColor),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 210.0.h,
                                  right: 14.w,
                                  left: 14.w,
                                  bottom: 20.h),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: StudyBuddy.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      currentIndex =
                                          (currentIndex + 1) % data.length;
                                    });
                                  },
                                  //return true when click on "Yes"
                                  child: const Text(
                                    'Next',
                                    style:
                                        TextStyle(color: StudyBuddy.whiteColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                default:
              }
              return const SizedBox();
            }),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final double right;
  final double left;
  final double top;
  final bool isFavorite;

  const CustomIcon({
    super.key,
    this.right = 0,
    this.left = 0,
    this.top = 14,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: right,
        top: 14,
        left: left,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Color(0xff919191),
            blurRadius: 10,
            spreadRadius: -6,
            offset: Offset(3, 4),
          )
        ],
        color: left > 0
            ? isFavorite
                ? StudyBuddy.secondaryColor
                : StudyBuddy.whiteColor
            : StudyBuddy.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          left > 0 ? Icons.favorite_outline : Icons.share,
          size: 16,
          color: left > 0
              ? isFavorite
                  ? StudyBuddy.whiteColor
                  : StudyBuddy.blackColor
              : StudyBuddy.blackColor,
        ),
      ),
    );
  }
}
