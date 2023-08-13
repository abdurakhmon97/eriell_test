import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(LoginInitial()) {
    on<OnNameChangedEvent>(_onNameChanged);

    on<OnPasswordChangedEvent>(_onPasswordChanged);
  }

  bool get isButtonEnabled => _isValidName && _isValidPassword;

  bool _isValidName = false;
  bool _isValidPassword = false;

  FutureOr<void> _onNameChanged(
      OnNameChangedEvent event, Emitter<SignInState> emit) {
    if (event.value.length < 4) {
      _isValidName = false;
    } else {
      _isValidName = true;
    }
    emit(NameStatusState(_isValidName));
  }

  FutureOr<void> _onPasswordChanged(
      OnPasswordChangedEvent event, Emitter<SignInState> emit) {
    if (event.value.length < 6) {
      _isValidPassword = false;
    } else {
      _isValidPassword = true;
    }
    emit(PasswordStatusState(_isValidPassword));
  }
}
