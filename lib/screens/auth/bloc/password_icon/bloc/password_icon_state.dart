part of 'password_icon_bloc.dart';

class PasswordIconBlocState extends Equatable {
  final bool? clickedState;
  final bool? signUpClickedState;
  final bool? confirmPasswordState;

  const PasswordIconBlocState(
      {this.clickedState, this.signUpClickedState, this.confirmPasswordState});

  @override
  List<bool?> get props =>
      [clickedState, signUpClickedState, confirmPasswordState];
}

class PasswordIconClickedState extends PasswordIconBlocState {
  const PasswordIconClickedState({super.clickedState});
}

class PasswordIconInitialState extends PasswordIconBlocState {
  const PasswordIconInitialState(
      {super.signUpClickedState,
      super.confirmPasswordState,
      super.clickedState});
}

class ConfirmSignUpPasswordIconClickedState extends PasswordIconBlocState {
  const ConfirmSignUpPasswordIconClickedState({super.confirmPasswordState});
}

class SignUpPasswordIconClickedState extends PasswordIconBlocState {
  const SignUpPasswordIconClickedState({super.signUpClickedState});
}
