part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class OnNameChangedEvent extends SignInEvent {
  final String value;

  const OnNameChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}

class OnPasswordChangedEvent extends SignInEvent {
  final String value;

  const OnPasswordChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}