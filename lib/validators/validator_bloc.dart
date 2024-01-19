import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'validator_event.dart';
part 'validator_state.dart';

class ValidatorBloc extends Bloc<ValidatorEvent, ValidatorState> {
  ValidatorBloc() : super(const ValidatorState()) {
    on<ValidateEmail>(_validateEmail);
    on<ValidatePassword>(_validatePassword);
    on<ValidateText>(_validateText);
  }

  _validateEmail(ValidateEmail event, Emitter<ValidatorState> emit) {
    emit(state.copyWith(
        email: event.email,
        isEmailValid: RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(event.email)));
  }

  _validatePassword(ValidatePassword event, Emitter<ValidatorState> emit) {
    emit(state.copyWith(
        password: event.password,
        isPasswordValid: event.password.length >= 6));
  }

  _validateText(ValidateText event, Emitter<ValidatorState> emit) {
    emit(state.copyWith(
        text: event.text,
        isTextValid: event.text.length >= 6));
  }
}
