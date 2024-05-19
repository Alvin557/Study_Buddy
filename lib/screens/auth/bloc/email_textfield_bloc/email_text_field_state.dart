part of 'email_text_field_bloc.dart';

@immutable
sealed class EmailTextFieldState extends Equatable {
  final String? value;
  const EmailTextFieldState({required this.value});
  @override
  List<String?> get props => [value];
}

final class EmailTextFieldInitial extends EmailTextFieldState {
  const EmailTextFieldInitial({required super.value});
}

final class EmailValidationSuccess extends EmailTextFieldState {
  const EmailValidationSuccess({required super.value});
}

final class EmailValidationError extends EmailTextFieldState {
  const EmailValidationError({required super.value});
}
