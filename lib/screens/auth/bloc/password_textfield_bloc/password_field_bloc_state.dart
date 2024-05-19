part of 'password_field_bloc.dart';

sealed class PasswordFieldBlocState extends Equatable {
  final String? value;
  final String? confirmPassword;
  const PasswordFieldBlocState({required this.value, this.confirmPassword});

  @override
  List<String?> get props => [value];
}

final class PasswordFieldBlocInitial extends PasswordFieldBlocState {
  const PasswordFieldBlocInitial({required super.value});
}

final class PasswordFieldError extends PasswordFieldBlocState {
  const PasswordFieldError({required super.value});
}

final class PasswordFieldSignUpError extends PasswordFieldBlocState {
  const PasswordFieldSignUpError({required super.value});
}

final class PasswordFieldSuccess extends PasswordFieldBlocState {
  const PasswordFieldSuccess({required super.value});
}

final class PasswordFaildMatch extends PasswordFieldBlocState {
  const PasswordFaildMatch({required super.value});
}
