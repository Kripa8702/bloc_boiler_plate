import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_boiler_plate/routing/app_routes.dart';
import 'package:bloc_boiler_plate/utils/navigator_service.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashInitial>(_onInitialize);
  }

  _onInitialize(
    SplashInitial event,
    Emitter<SplashState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.loginOrSignupScreen,
      );
    });
  }
}
