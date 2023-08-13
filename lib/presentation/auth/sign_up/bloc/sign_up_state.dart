part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class NameStatusState extends SignUpState {
  final bool isValidName;

  const NameStatusState(this.isValidName);

  @override
  List<Object> get props => [isValidName];
}

class PasswordStatusState extends SignUpState {
  final bool isValidPassword;

  const PasswordStatusState(this.isValidPassword);

  @override
  List<Object> get props => [isValidPassword];
}

class RepeatPasswordStatusState extends SignUpState {
  final bool isSamePassword;

  const RepeatPasswordStatusState(this.isSamePassword);

  @override
  List<Object> get props => [isSamePassword];
}
