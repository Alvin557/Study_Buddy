import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'config/route.dart';
import 'const/route_const.dart';
import 'screens/auth/bloc/email_textfield_bloc/email_text_field_bloc.dart';
import 'screens/auth/bloc/password_icon/bloc/password_icon_bloc.dart';
import 'screens/auth/bloc/password_textfield_bloc/password_field_bloc.dart';
import 'screens/auth/bloc/submit_button_bloc/bloc/click_submit_button_bloc.dart';
import 'screens/bottom_navigation/bottom_sheet_provider.dart';
import 'screens/quizz/quizz_number_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB010fem7oKPCVB5E0vXsakRQ5hJLGGdhU",
          appId: "1:313216686576:android:4a9a9257d66f901e216535",
          messagingSenderId: "",
          projectId: "studybuddy-31594"));
  runApp(MultiBlocProvider(providers: [
    BlocProvider<EmailTextFieldBloc>(create: (context) => EmailTextFieldBloc()),
    ChangeNotifierProvider<QuizzNUmberProvider>(
        create: (context) => QuizzNUmberProvider()),
    BlocProvider<PasswordFieldBloc>(create: (context) => PasswordFieldBloc()),
    BlocProvider<PasswordIconBloc>(create: (context) => PasswordIconBloc()),
    ChangeNotifierProvider<BottomsheetProvider>(
        create: (context) => BottomsheetProvider()),
    BlocProvider<ClickSubmitButtonBloc>(
        create: (context) => ClickSubmitButtonBloc()),
    BlocProvider<ClickLoginSubmitButtonBloc>(
        create: (context) => ClickLoginSubmitButtonBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: splashScreenRoute,
          onGenerateRoute: StudyBuddyRoute.generateRoute,
        ),
      ),
    );
  }
}
