import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<OnNameChangedEvent>(_onNameChanged);
    on<OnPasswordChangedEvent>(_onPasswordChanged);
    on<OnRepeatPasswordChangedEvent>(_onRepeatPasswordChanged);
  }

  bool get isButtonEnabled =>
      _isValidName && _isValidPassword && _isValidRepeatPassword;

  final TextEditingController passwordController = TextEditingController();

  bool _isValidRepeatPassword = false;
  bool _isValidName = false;
  bool _isValidPassword = false;

  @override
  Future<void> close() {
    passwordController.dispose();
    return super.close();
  }

  FutureOr<void> _onNameChanged(
      OnNameChangedEvent event, Emitter<SignUpState> emit) {
    if (event.value.length < 4) {
      _isValidName = false;
    } else {
      _isValidName = true;
    }
    emit(NameStatusState(_isValidName));
  }

  FutureOr<void> _onPasswordChanged(
      OnPasswordChangedEvent event, Emitter<SignUpState> emit) {
    if (event.value.length < 6) {
      _isValidPassword = false;
    } else {
      _isValidPassword = true;
    }
    emit(PasswordStatusState(_isValidPassword));
  }

  FutureOr<void> _onRepeatPasswordChanged(
      OnRepeatPasswordChangedEvent event, Emitter<SignUpState> emit) {
    if (event.value != passwordController.text) {
      _isValidRepeatPassword = false;
    } else {
      _isValidRepeatPassword = true;
    }
    emit(RepeatPasswordStatusState(_isValidRepeatPassword));
  }
}
