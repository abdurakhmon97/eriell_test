import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:eriell/data/hive/credentials_hive_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(LoginInitial()) {
    on<OnNameChangedEvent>(_onNameChanged);
    on<OnPasswordChangedEvent>(_onPasswordChanged);
    on<OnCheckCredentialsEvent>(_onCheckCredentials);
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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

  FutureOr<void> _onCheckCredentials(
    OnCheckCredentialsEvent event,
    Emitter<SignInState> emit,
  ) async {
    final db = Hive.box<CredentialsHiveObject>('users');
    for (var element in db.values) {
      final credentials = CredentialsHiveObject(
        username: usernameController.text,
        password: passwordController.text,
      );
      if (credentials == element) {
        return emit(const CredentialsStatusState(true));
      }
    }
    return emit(const CredentialsStatusState(false));
  }
}
