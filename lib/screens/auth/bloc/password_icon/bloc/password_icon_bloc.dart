import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_icon_event.dart';
part 'password_icon_state.dart';

class PasswordIconBloc
    extends Bloc<PasswordIconBlocEvent, PasswordIconBlocState> {
  PasswordIconBloc()
      : super(const PasswordIconInitialState(
            confirmPasswordState: false,
            clickedState: false,
            signUpClickedState: false)) {
    on<PasswordIconClickedEvent>(
      (event, emit) {
        emit(PasswordIconClickedState(clickedState: event.loginState));
      },
    );

    on<PasswordSignUpIconClickedEvent>((event, emit) {
      emit(SignUpPasswordIconClickedState(
          signUpClickedState: event.signUpState));
    });

    on<ConfirmSignupPasswordIconClickedEvent>(
      (event, emit) {
        emit(ConfirmSignUpPasswordIconClickedState(
            confirmPasswordState: event.confirmState));
      },
    );
  }
}
