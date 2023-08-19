part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends SignInState {}

class NameStatusState extends SignInState {
  final bool isValidName;

  const NameStatusState(this.isValidName);

  @override
  List<Object> get props => [isValidName];
}

class PasswordStatusState extends SignInState {
  final bool isValidPassword;

  const PasswordStatusState(this.isValidPassword);

  @override
  List<Object> get props => [isValidPassword];
}

class CredentialsStatusState extends SignInState {
  final bool userExists;

  const CredentialsStatusState(this.userExists);

  @override
  List<Object> get props => [userExists];
}
