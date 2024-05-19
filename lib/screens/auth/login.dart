import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/route_const.dart';
import '../show_exit_popup.dart';
import 'bloc/email_textfield_bloc/email_text_field_bloc.dart';
import 'bloc/password_icon/bloc/password_icon_bloc.dart';
import 'bloc/password_textfield_bloc/password_field_bloc.dart';
import 'bloc/submit_button_bloc/bloc/click_submit_button_bloc.dart';
import 'widgets/email_textfield.dart';
import 'widgets/password_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                showExitPopup(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              )),
          Expanded(child: Container())
        ],
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didpop) {
          if (didpop) return;
          showExitPopup(context);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderText(
                    headerText: "Log in",
                  ),
                  const SizedBox(
                    height: 58,
                  ),
                  const Text(
                    "Your Email",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 5.81,
                  ),
                  EmailTextfield(
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 22.81,
                  ),
                  const Text("Password"),
                  const SizedBox(
                    height: 5.81,
                  ),
                  BlocBuilder<PasswordFieldBloc, PasswordFieldBlocState>(
                    builder: (_, fieldState) {
                      return BlocBuilder<PasswordIconBloc,
                          PasswordIconBlocState>(
                        builder: (_, iconState) {
                          return iconState is PasswordIconClickedState
                              ? PasswordTextfield(
                                  text: "Enter your password",
                                  controller: _passwordController,
                                  value: fieldState.value,
                                  clickedState: iconState.clickedState,
                                  state: PasswordFieldState.login,
                                )
                              : PasswordTextfield(
                                  text: "Enter your password",
                                  controller: _passwordController,
                                  value: fieldState.value,
                                  clickedState: iconState.clickedState == null
                                      ? false
                                      : !iconState.clickedState!,
                                  state: PasswordFieldState.login,
                                );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12.81,
                  ),
                  BlocBuilder<ClickLoginSubmitButtonBloc,
                      ClickLoginSubmitButtonState>(builder: (context, state) {
                    return state is ClickLoginFailure
                        ? const Text(
                            "Incorrect credentials, please enter valid username and password",
                            style: TextStyle(color: Colors.red),
                          )
                        : const SizedBox();
                  }),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff858597),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12.81,
                  ),
                  SizedBox(
                    height: 51.26,
                    width: MediaQuery.of(context).size.width,
                    child: BlocConsumer<ClickLoginSubmitButtonBloc,
                        ClickLoginSubmitButtonState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff2EC4B6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              context.read<EmailTextFieldBloc>().add(
                                  ValidateEmailEvent(
                                      email: _emailController.text));

                              context.read<PasswordFieldBloc>().add(
                                  ValidPasswordEvent(
                                      password: _passwordController.text));

                              context.read<ClickLoginSubmitButtonBloc>().add(
                                  ClickLoginSubmit(
                                      email: _emailController.text,
                                      password: _passwordController.text));
                            },
                            child: const Text(
                              "Log in",
                              style: TextStyle(color: Color(0xffffffff)),
                            ));
                      },
                      listener: (BuildContext context,
                          ClickLoginSubmitButtonState state) async {
                        bool first = true;
                        if (first &&
                            state.success! &&
                            state is ClickLoginSubmitSuccess) {
                          first = false;
                          context.read<ClickLoginSubmitButtonBloc>().add(
                              const ClickLoginSubmit(
                                  email: null, password: null));
                          SharedPreferences? prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool("loggedIn", true);
                          Navigator.pushReplacementNamed(
                              // ignore: use_build_context_synchronously
                              context,
                              successScreenRoute);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Column(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                  color: Color(0xff858597), fontSize: 14)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, signUpScreenRoute);
                                  context
                                      .read<EmailTextFieldBloc>()
                                      .add(ValidateEmailEvent(email: null));
                                  context.read<PasswordFieldBloc>().add(
                                      const ValidPasswordEvent(password: null));
                                },
                              text: "Sign up",
                              style: const TextStyle(
                                  fontSize: 14, color: Color(0xff2EC4B6)))
                        ]))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 1,
                        width: 105,
                        color: const Color(0xffB8B8D2),
                      ),
                      const Text(
                        "Or login with",
                        style:
                            TextStyle(color: Color(0xff858597), fontSize: 14),
                      ),
                      Container(
                        height: 1,
                        width: 105,
                        color: const Color(0xffB8B8D2),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        customBorder: const CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 33,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      InkWell(
                        onTap: () {},
                        customBorder: const CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/facebook.png",
                            height: 33,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String headerText;
  const HeaderText({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      style: const TextStyle(
          fontSize: 32, color: Color(0xff1F1F39), fontWeight: FontWeight.bold),
    );
  }
}
