import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:eriell/data/hive/credentials_hive_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<OnNameChangedEvent>(_onNameChanged);
    on<OnPasswordChangedEvent>(_onPasswordChanged);
    on<OnRepeatPasswordChangedEvent>(_onRepeatPasswordChanged);
    on<OnCreateProfileEvent>(_onCreateProfile);
  }

  bool get isButtonEnabled =>
      _isValidName && _isValidPassword && _isValidRepeatPassword;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isValidRepeatPassword = false;
  bool _isValidName = false;
  bool _isValidPassword = false;

  @override
  Future<void> close() {
    usernameController.dispose();
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

  FutureOr<void> _onCreateProfile(
      OnCreateProfileEvent event, Emitter<SignUpState> emit) async {
    final db = Hive.box<CredentialsHiveObject>('users');
    for (var element in db.values) {
      if (usernameController.text == element.username) {
        emit(const CreateProfileState(true));
        return;
      }
    }
    await db.add(
      CredentialsHiveObject(
        username: usernameController.text,
        password: passwordController.text,
      ),
    );
    emit(const CreateProfileState(false));
  }
}
