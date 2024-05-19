part of 'password_icon_bloc.dart';

class PasswordIconBlocEvent extends Equatable {
  const PasswordIconBlocEvent();

  @override
  List<Object?> get props => [];
}

class PasswordIconClickedEvent extends PasswordIconBlocEvent {
  final bool? loginState;
  const PasswordIconClickedEvent({required this.loginState});
}

class PasswordSignUpIconClickedEvent extends PasswordIconBlocEvent {
  final bool? signUpState;
  const PasswordSignUpIconClickedEvent({required this.signUpState});
}

class ConfirmSignupPasswordIconClickedEvent extends PasswordIconBlocEvent {
  final bool? confirmState;
  const ConfirmSignupPasswordIconClickedEvent({required this.confirmState});
}
