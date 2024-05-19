part of 'password_field_bloc.dart';

sealed class PasswordFieldBlocEvent extends Equatable {
  const PasswordFieldBlocEvent();

  @override
  List<Object> get props => [];
}

class ValidPasswordEvent extends PasswordFieldBlocEvent {
  final String? password;
  const ValidPasswordEvent({required this.password});
}

class ValidSignUpPasswordEvent extends PasswordFieldBlocEvent {
  final String? password;
  final String? confirmPassword;
  const ValidSignUpPasswordEvent({this.password, this.confirmPassword});
}
