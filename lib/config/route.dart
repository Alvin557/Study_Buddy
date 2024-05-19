import 'package:flutter/material.dart';
import 'package:study_buddy/screens/search/study_materials.dart';

import '../const/route_const.dart';
import '../screens/auth/login.dart';
import '../screens/auth/signup.dart';
import '../screens/auth/success.dart';
import '../screens/bottom_navigation/bottom_navigation.dart';
import '../screens/flashcard/add_flashcard.dart';
import '../screens/flashcard/flashcards.dart';
import '../screens/forum/add_forum.dart';
import '../screens/profile/profile.dart';
import '../screens/quizz/add_quizz.dart';
import '../screens/quizz/take_quizz.dart';
import '../screens/search/search_study_material.dart';
import '../screens/slider/slider_screen.dart';
import '../screens/study_details/start_learning.dart';
import '../screens/study_details/study_detail_screen.dart';
import '../screens/study_plans/add_study_plan.dart';
import '../screens/study_plans/study_plans_screen.dart';
import '../screens/welcome/splash_screen/splash_screen.dart';

class StudyBuddyRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case sliderScreenRoute:
        return _getPageRoute(const SliderScreen());
      case splashScreenRoute:
        return _getPageRoute(const SplashScreen());
      case loginScreenRoute:
        return _getPageRoute(LoginScreen());
      case signUpScreenRoute:
        return _getPageRoute(const SignUpScreen());
      case successScreenRoute:
        return _getPageRoute(const SuccessScreen());
      case bottomNavigationScreenRoute:
        return _getPageRoute(const CustomBottomNavigation());
      case addStudyPlansRoute:
        return _getPageRoute(const AddStudyPlans());
      case searchStudyMaterial:
        return _getPageRoute(SearchStudyMaterial());
      case startLearningRoute:
        return _getPageRoute(const StartLearning());
      case addQuizzRoute:
        return _getPageRoute(const AddQuizz());
      case flashcardRoute:
        return _getPageRoute(const Flashcards());
      case addFlashcardRoute:
        return _getPageRoute(AddFlashCard());
      case studyPlansRoute:
        return _getPageRoute(StudyPlansScreen());
      case takeQuizzRoute:
        return _getPageRoute(const TakeQuizz());
      case studyDetailsRoute:
        return _getPageRoute(StudyDetailScreen());
      case addForumRoute:
        return _getPageRoute(const AddForum());
      case profileScreenRoute:
        return _getPageRoute(const ProfileScreen());
      case studyMaterialRoute:
        return _getPageRoute(const StudyMaterial());
    }
    return null
  }

  static PageRoute _getPageRoute(Widget viewToShow) {
    return MaterialPageRoute(builder: (_) => viewToShow);
  }
}
