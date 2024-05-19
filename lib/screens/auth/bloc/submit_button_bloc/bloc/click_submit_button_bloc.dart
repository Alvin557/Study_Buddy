import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'click_submit_button_event.dart';
part 'click_submit_button_state.dart';

class ClickSubmitButtonBloc
    extends Bloc<ClickSubmitButtonEvent, ClickSubmitButtonState> {
  ClickSubmitButtonBloc() : super(ClickSubmitButtonInitial()) {
    on<ClickSubmitButtonEvent>((event, emit) {
      bool isEmailValid(String email) {
        // Basic email validation using regex
        // You can implement more complex validation if needed
        return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
      }

      if (event.confirmPassword == event.password &&
          event.email!.isNotEmpty &&
          isEmailValid(event.email!)) {
        emit(ClickSubmitSuccess());
      } else {
        emit(ClickSubmitFailure());
      }
    });
  }
}

class ClickLoginSubmitButtonBloc
    extends Bloc<ClickLoginSubmitButtonEvent, ClickLoginSubmitButtonState> {
  ClickLoginSubmitButtonBloc()
      : super(const ClickLoginSubmitButtonInitial(success: false)) {
    on<ClickLoginSubmit>((event, emit) async {
      bool incorrectCredential = false;

      FirebaseAuth auth = FirebaseAuth.instance;
      bool isEmailValid(String email) {
        // Basic email validation using regex
        // You can implement more complex validation if needed
        return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
      }

      try {
        if (event.email == null && event.password == null) {
          emit(CLickLoginSubmitButton(success: incorrectCredential));
        } else if (event.email!.isEmpty ||
            event.password!.isEmpty ||
            !isEmailValid(event.email!)) {
          emit(CLickLoginSubmitButton(success: incorrectCredential));
        } else {
          UserCredential user = await auth.signInWithEmailAndPassword(
              email: event.email!, password: event.password!);
          if (user.user == null) {
            emit(const CLickLoginSubmitButton(success: true));
          }
          emit(ClickLoginSubmitSuccess(success: !incorrectCredential));
        }
      } catch (e) {
        emit(const ClickLoginFailure(success: true));
      }
    });
  }
}
