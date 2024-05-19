import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_field_bloc_event.dart';
part 'password_field_bloc_state.dart';

class PasswordFieldBloc
    extends Bloc<PasswordFieldBlocEvent, PasswordFieldBlocState> {
  PasswordFieldBloc() : super(const PasswordFieldBlocInitial(value: null)) {
    on<ValidPasswordEvent>((event, emit) {
      if (event.password == null) {
        emit(const PasswordFieldBlocInitial(value: null));
      } else if (event.password!.isEmpty) {
        emit(const PasswordFieldError(value: 'Please enter a password!'));
      } else {
        emit(const PasswordFieldSuccess(value: null));
      }
    });

    on<ValidSignUpPasswordEvent>(
      (event, emit) {
        if (event.password == null) {
          emit(const PasswordFieldBlocInitial(value: null));
        } else if (event.password!.isEmpty) {
          emit(const PasswordFieldError(value: "Please enter password."));
        } else if (event.password!.length < 10) {
          emit(const PasswordFieldError(
              value: "Password should be of 10 characters."));
        } else if (event.password != event.confirmPassword) {
          emit(const PasswordFaildMatch(value: "Password did not matched"));
        } else {
          emit(const PasswordFieldSuccess(value: null));
        }
      },
    );
  }
}
