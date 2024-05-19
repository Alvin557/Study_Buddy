import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/route_const.dart';
import '../forum/forum_screen.dart';
import '../group/group_screen.dart';
import '../home/home_screen.dart';
import '../show_exit_popup.dart';
import '../study_plans/study_plans_screen.dart';
import 'bottom_sheet_nav_item.dart';
import 'bottom_sheet_provider.dart';

class CustomBottomNavigation extends StatelessWidget {
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const ForumScreen(),
    StudyPlansScreen(),
    const GroupScreen(),
  ];

  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomsheetProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: PopScope(
            canPop: false,
            onPopInvoked: (didpop) {
              if (didpop) return;
              showExitPopup(context);
            },
            child: _widgetOptions.elementAt(provider.selectedIndex)),
      ),
      bottomNavigationBar: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNavItem("Home", "assets/images/home.png", 0, provider),
                CustomNavItem("Forum", "assets/images/forum.png", 1, provider),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, searchStudyMaterial);
                  },
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: const BoxDecoration(
                        color: Color(0xffCBF3F0), shape: BoxShape.circle),
                    child: const Center(
                        child: Icon(
                      Icons.search,
                      color: Color(0xff919191),
                    )),
                  ),
                ),
                CustomNavItem(
                    "Plans", "assets/images/message.png", 2, provider),
                CustomNavItem("Group", "assets/images/user.png", 3, provider),
              ],
            ),
          )),
    );
  }
}
