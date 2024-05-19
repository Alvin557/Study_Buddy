import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/route_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences? prefs = await SharedPreferences.getInstance();

      bool firstTimeOrNot = prefs.getBool("first_time") ?? true;
      bool loggedIn = prefs.getBool("loggedIn") ?? false;
      if (!mounted) return;
      Navigator.pushReplacementNamed(
          context,
          firstTimeOrNot
              ? sliderScreenRoute
              : loggedIn
                  ? bottomNavigationScreenRoute
                  : loginScreenRoute);

      prefs.setBool("first_time", false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffCBF3F0),
              Color(0xff2EC4B6),
              Color(0xffFFBF69),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(height: 10.h),
              Center(child: Image.asset(height: 200, "assets/images/logo.png")),
              const Spacer(),
              LoadingAnimationWidget.waveDots(
                  color: const Color(0xffffffff), size: 33.sp),
              SizedBox(height: 68.h)
            ],
          ),
        ),
      ),
    );
  }
}
