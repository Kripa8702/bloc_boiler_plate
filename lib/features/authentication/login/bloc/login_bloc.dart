import 'dart:async';

import 'package:bloc_boiler_plate/features/authentication/model/user_model.dart';
import 'package:bloc_boiler_plate/features/authentication/repository/auth_repository.dart';
import 'package:bloc_boiler_plate/utils/toast_utils.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      final user = await authRepo.signIn(event.email, event.password);
      emit(state.copyWith(user: user, status: LoginStatus.success));
    } on DioException catch (e) {
      ToastUtils.showToast(e.response?.data["message"]);
      emit(state.copyWith(
          status: LoginStatus.failure, message: e.response?.data["message"]));
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
