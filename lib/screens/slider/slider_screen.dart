import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/route_const.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    'assets/images/illustration.png',
    'assets/images/illustration2.png',
    'assets/images/illustration3.png',
  ];

  final List<String> _texts = [
    'Numerous free trial courses',
    "Quick and easy learning",
    'Create your own study plan'
  ];
  final List<String> _subText = [
    "Free courses for you to find your way to learning",
    "Easy and fast learning at any time to help you improve various skills",
    "Study according to the study plan, make study more motivated"
  ];
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 26.w, right: 26.w, top: 56.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        _pageController.jumpToPage(2);
                      },
                      child: const CustomSliderText(
                        text: "Skip",
                      )),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _imageUrls.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 280.h,
                          padding: EdgeInsets.only(
                              bottom: 37.h, top: 11.h, right: 58, left: 58),
                          child:
                              Image.asset(_imageUrls[index], fit: BoxFit.fill)),
                      Padding(
                        padding: const EdgeInsets.only(left: 80, right: 80),
                        child: Text(
                          _texts[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28.h, fontWeight: FontWeight.w900),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 110.0, right: 110),
                          child: CustomSliderText(
                            text: _subText[index],
                          )),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotWidget(
                      pageIndex: _currentIndex,
                      dotIndex: 0,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    DotWidget(
                      pageIndex: _currentIndex,
                      dotIndex: 1,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    DotWidget(
                      pageIndex: _currentIndex,
                      dotIndex: 2,
                    )
                  ],
                ),
                _currentIndex == 2
                    ? Padding(
                        padding:
                            const EdgeInsets.only(right: 20, left: 20, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff2EC4B6),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, signUpScreenRoute);
                                  },
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(color: Color(0xffffffff)),
                                  )),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffffffff),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              color: Color(0xff2EC4B6)))),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, loginScreenRoute);
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(color: Color(0xff2EC4B6)),
                                  )),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          statesController: NoSplashState(),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              splashFactory: NoSplash.splashFactory),
                          onPressed: () {},
                          child: const SizedBox(),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliderText extends StatelessWidget {
  final String text;
  const CustomSliderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14.h, color: const Color(0xff919191)),
    );
  }
}

class DotWidget extends StatelessWidget {
  final int pageIndex;
  final int dotIndex;
  const DotWidget({super.key, required this.pageIndex, required this.dotIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.3,
      width: pageIndex == dotIndex ? 28.45 : 9.14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(pageIndex == dotIndex ? 0xff2EC4B6 : 0xffe9e9e9)),
    );
  }
}

class NoSplashState extends WidgetStatesController {
  @override
  void update(WidgetState state, bool add) {}
}
