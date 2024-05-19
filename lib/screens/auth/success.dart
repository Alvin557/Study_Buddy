import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/route_const.dart';
import '../show_exit_popup.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  bool isPlaying = false;
  final controller = ConfettiController(duration: const Duration(seconds: 10));

  @override
  void initState() {
    super.initState();
    controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PopScope(
          canPop: false,
          onPopInvoked: (didpop) {
            if (didpop) return;
            showExitPopup(context,
                message:
                    "Do you want to exit an app without completing signing process?");
          },
          child: Scaffold(
              backgroundColor: const Color(0xff858597),
              body: Center(
                  child: Container(
                height: 296,
                width: 296,
                padding: const EdgeInsets.only(top: 54, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffffffff),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 63,
                      width: 64,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff2EC4B6)),
                      child: const Icon(
                        size: 35,
                        Icons.check,
                        color: Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "Success",
                      style: TextStyle(color: Color(0xff1E1E1E), fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Congratulations, you have completed your registration!",
                        style:
                            TextStyle(color: Color(0xff858597), fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      width: 296,
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2EC4B6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "Done",
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, bottomNavigationScreenRoute);
                        },
                      ),
                    )
                  ],
                ),
              ))),
        ),
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: controller,
            shouldLoop: true,
            blastDirection: -pi / 2,
            blastDirectionality: BlastDirectionality.explosive,
            emissionFrequency: 0.01,
            numberOfParticles: 30,
            maxBlastForce: 20,
            minBlastForce: 10,
            gravity: 0.3,
          ),
        ),
      ],
    );
  }
}
