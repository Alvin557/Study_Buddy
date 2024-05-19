import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/colors.dart';

class AddFlashCard extends StatelessWidget {
  AddFlashCard({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    DocumentReference<Map<String, dynamic>> flashCard = FirebaseFirestore
        .instance
        .collection("flashcard")
        .doc(auth.currentUser!.uid);
    final titleTextController = TextEditingController();
    final descriptionTextController = TextEditingController();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Flashcard"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(width: 1, color: StudyBuddy.greyColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Flash Cards",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: titleTextController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter title";
                    } else if (value.length > 20) {
                      return "Title should be 20 character less.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter title",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff2EC4B6)),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffB8B8D2)),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffB8B8D2)),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffB8B8D2)),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: descriptionTextController,
                  maxLines: 4,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter description";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter description",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff2EC4B6)),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffB8B8D2)),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffB8B8D2)),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffB8B8D2)),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        flashCard.collection("individualFlashCard").add({
                          "title": titleTextController.text,
                          "description": descriptionTextController.text,
                          "favorite": false
                        });
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xff2EC4B6)),
                    //return false when click on "NO"

                    child: Text(
                      'Add Flashcard',
                      style: TextStyle(
                          color: const Color(0xffffffff), fontSize: 16.h),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
