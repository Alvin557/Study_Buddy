part of 'click_submit_button_bloc.dart';

sealed class ClickSubmitButtonState extends Equatable {
  const ClickSubmitButtonState();

  @override
  List<Object> get props => [];
}

final class ClickSubmitButtonInitial extends ClickSubmitButtonState {}

final class ClickSubmitSuccess extends ClickSubmitButtonState {}

final class ClickSubmitFailure extends ClickSubmitButtonState {}

sealed class ClickLoginSubmitButtonState extends Equatable {
  final bool? success;
  const ClickLoginSubmitButtonState({required this.success});
  @override
  List<bool?> get props => [success];
}

final class ClickLoginSubmitButtonInitial extends ClickLoginSubmitButtonState {
  const ClickLoginSubmitButtonInitial({required super.success});
}

final class CLickLoginSubmitButton extends ClickLoginSubmitButtonState {
  const CLickLoginSubmitButton({required super.success});
}

final class ClickLoginSubmitSuccess extends ClickLoginSubmitButtonState {
  const ClickLoginSubmitSuccess({required super.success});
}

final class ClickLoginFailure extends ClickLoginSubmitButtonState {
  const ClickLoginFailure({required super.success});
}
