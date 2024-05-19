import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/password_icon/bloc/password_icon_bloc.dart';

class PasswordTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool? clickedState;
  final String? value;
  final PasswordFieldState? state;
  const PasswordTextfield(
      {super.key,
      required this.text,
      required this.controller,
      required this.value,
      required this.state,
      required this.clickedState});

  @override
  Widget build(context) {
    return TextFormField(
      controller: controller,
      obscureText: clickedState!,
      decoration: InputDecoration(
        suffixIcon: InkWell(
            onTap: () {
              context
                  .read<PasswordIconBloc>()
                  .add(getEventForState(state!, clickedState!));
            },
            child: Icon(
              !clickedState! ? Icons.visibility : Icons.visibility_off,
              color: const Color(0xff1F1F39),
            )),
        hintText: text,
        errorText: value,
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
    );
  }
}

PasswordIconBlocEvent getEventForState(
    PasswordFieldState state, bool clickedState) {
  switch (state) {
    case PasswordFieldState.login:
      return PasswordIconClickedEvent(loginState: !clickedState);
    case PasswordFieldState.signUp:
      return PasswordSignUpIconClickedEvent(signUpState: !clickedState);
    case PasswordFieldState.signUpConfirm:
      return ConfirmSignupPasswordIconClickedEvent(confirmState: !clickedState);
  }
}

enum PasswordFieldState {
  login,
  signUp,
  signUpConfirm
} // Define password field states
