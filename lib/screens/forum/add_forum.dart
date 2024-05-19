import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../study_plans/add_study_plan.dart';
import 'forum_screen.dart';

class AddForum extends StatefulWidget {
  const AddForum({super.key});

  @override
  State<AddForum> createState() => _AddForumState();
}

class _AddForumState extends State<AddForum> {
  final _formKey = GlobalKey<FormState>();

  final titleTextController = TextEditingController();

  final titleDescription = TextEditingController();
  bool imageSelected = false;

  @override
  Widget build(BuildContext context) {
    CollectionReference forum = FirebaseFirestore.instance.collection("forum");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Forum",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: "Title "),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    controller: titleTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter title";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter title ",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff2EC4B6)),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffB8B8D2)),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffB8B8D2)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffB8B8D2)),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: "Description"),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    maxLines: 5,
                    controller: titleDescription,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter description";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter description ",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff2EC4B6)),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffB8B8D2)),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffB8B8D2)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffB8B8D2)),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: StudyBuddy.lightPrimary),
                      onPressed: () {
                        setState(() {
                          imageSelected = true;
                        });
                      },
                      child: Text(
                        "Upload Image",
                        style: TextStyle(
                            color: StudyBuddy.blackColor.withOpacity(0.6)),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  imageSelected
                      ? const Text("Image selected: Image.png")
                      : const Text("No image selected!"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: StudyBuddy.primaryColor),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        forum.add({
                          "title": titleTextController.text,
                          "description": titleDescription.text,
                          "image": imageSelected ? "Image.png" : ""
                        });
                        const ForumScreen();

                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "Post",
                      style:
                          TextStyle(color: StudyBuddy.whiteColor, fontSize: 16),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
