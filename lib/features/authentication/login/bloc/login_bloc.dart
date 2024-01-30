import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_boiler_plate/features/authentication/login/model/user_model.dart';
import 'package:bloc_boiler_plate/features/authentication/login/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.authRepo}) : super(const LoginState()) {
    on<Login>(_onLogin);
    on<Logout>(_onLogout);
  }

  AuthRepository authRepo;

  Future<void> _onLogin(Login event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final user = await authRepo.signIn(event.email,  event.password);
      emit(state.copyWith(user: user, status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  Future<void> _onLogout(Logout event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      authRepo.signOut();
      emit(state.copyWith(status: LoginStatus.initial));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

} 
