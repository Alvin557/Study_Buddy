import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'email_text_field_event.dart';
part 'email_text_field_state.dart';

class EmailTextFieldBloc
    extends Bloc<EmailTextFieldEvent, EmailTextFieldState> {
  EmailTextFieldBloc() : super(const EmailTextFieldInitial(value: null)) {
    on<ValidateEmailEvent>((event, emit) async {
      bool isEmailValid(String email) {
        // Basic email validation using regex
        // You can implement more complex validation if needed
        return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
      }

      if (event.email == null) {
        emit(const EmailTextFieldInitial(value: null));
      } else if (event.email!.isEmpty) {
        emit(const EmailValidationError(value: "Enter Email!"));
      } else if (!isEmailValid(event.email!)) {
        emit(const EmailValidationError(value: "Please Enter Valid Email!"));
      } else {
        emit(const EmailValidationSuccess(value: null));
      }
    });
  }
}
