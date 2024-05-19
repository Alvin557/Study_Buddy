import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/email_textfield_bloc/email_text_field_bloc.dart';

class EmailTextfield extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextfield({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailTextFieldBloc, EmailTextFieldState>(
      builder: (context, state) {
        return TextFormField(
          key: key,
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter your email ",
            errorText: state.value,
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
      },
    );
  }
}
