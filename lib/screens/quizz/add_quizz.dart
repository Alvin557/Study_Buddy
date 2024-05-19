import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import 'quizz_number_provider.dart';

class AddQuizz extends StatefulWidget {
  const AddQuizz({super.key});

  @override
  State<AddQuizz> createState() => _AddQuizzState();
}

class _AddQuizzState extends State<AddQuizz> {
  final _formKey = GlobalKey<FormState>();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuizzNUmberProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Add Quizzes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(width: 1, color: StudyBuddy.greyColor)),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create Quizz",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter question.";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter the question!",
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
                  ),
                  const CustomTextField(
                    hintText: 'Option 1',
                    fieldIndex: 1,
                  ),
                  const CustomTextField(
                    hintText: 'Option 2',
                    fieldIndex: 2,
                  ),
                  const CustomTextField(
                    hintText: 'Option 3',
                    fieldIndex: 3,
                  ),
                  const CustomTextField(
                    hintText: 'Option 4',
                    fieldIndex: 4,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  provider.selectedIndex == 0 && provider.clicked
                      ? const Text(
                          "Please mark the correct answer.",
                          style: TextStyle(color: Colors.red),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          provider.changeClicked(true);
                          if (provider.selectedIndex != 0) {
                            Navigator.pop(context);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0xff2EC4B6)),
                      //return false when click on "NO"

                      child: Text(
                        'Add Quizz',
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
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int fieldIndex;
  const CustomTextField({
    super.key,
    required this.fieldIndex,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuizzNUmberProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Please $hintText";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: IconButton(
            icon: ImageIcon(
                color: fieldIndex == provider.selectedIndex
                    ? StudyBuddy.secondaryColor
                    : StudyBuddy.greyColor,
                const AssetImage(
                  "assets/images/checkmark.png",
                )),
            onPressed: () {
              provider.changeIndex(fieldIndex);
            },
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
    );
  }
}
