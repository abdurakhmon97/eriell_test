part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class OnNameChangedEvent extends SignUpEvent {
  final String value;

  const OnNameChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}

class OnPasswordChangedEvent extends SignUpEvent {
  final String value;

  const OnPasswordChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}

class OnRepeatPasswordChangedEvent extends SignUpEvent {
  final String value;

  const OnRepeatPasswordChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}
