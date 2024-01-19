part of 'validator_bloc.dart';

class ValidatorState extends Equatable {
  final String? email;
  final String? password;
  final String? text;
  final bool? isEmailValid;
  final bool? isPasswordValid;
  final bool? isTextValid;

  const ValidatorState({
    this.email,
    this.password,
    this.text,
    this.isEmailValid,
    this.isPasswordValid,
    this.isTextValid,
  });

  ValidatorState copyWith({
    String? email,
    String? password,
    String? text,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isTextValid,
  }) {
    return ValidatorState(
        email: email ?? this.email,
        password: password ?? this.password,
        text: text ?? this.text,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isTextValid: isTextValid ?? this.isTextValid);
  }

  @override
  List<Object?> get props =>
      [email, password, text, isEmailValid, isPasswordValid, isTextValid];
}
