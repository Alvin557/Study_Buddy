part of 'email_text_field_bloc.dart';

@immutable
sealed class EmailTextFieldEvent {}

class ValidateEmailEvent extends EmailTextFieldEvent {
  final String? email;
  ValidateEmailEvent({required this.email});
}
