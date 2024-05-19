part of 'click_submit_button_bloc.dart';

sealed class ClickSubmitButtonEvent extends Equatable {
  final String? email;
  final String? password;
  final String? confirmPassword;

  const ClickSubmitButtonEvent(
      {required this.email, required this.password, this.confirmPassword});

  @override
  List<Object?> get props => [email, password, confirmPassword];
}

class ClickSubmit extends ClickSubmitButtonEvent {
  const ClickSubmit(
      {required super.email,
      required super.password,
      required super.confirmPassword});
}

abstract class ClickLoginSubmitButtonEvent extends Equatable {
  final String? email;
  final String? password;

  const ClickLoginSubmitButtonEvent(
      {required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class ClickLoginSubmit extends ClickLoginSubmitButtonEvent {
  const ClickLoginSubmit({required super.email, required super.password});
}
