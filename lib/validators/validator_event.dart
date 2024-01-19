part of 'validator_bloc.dart';

@immutable
abstract class ValidatorEvent {}

class ValidateEmail extends ValidatorEvent {
  final String email;

  ValidateEmail({required this.email});
}

class ValidatePassword extends ValidatorEvent {
  final String password;

  ValidatePassword({required this.password});
}

class ValidateText extends ValidatorEvent {
  final String text;

  ValidateText({required this.text});
}
