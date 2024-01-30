import 'package:bloc_boiler_plate/features/authentication/login/view/login_screen.dart';
import 'package:bloc_boiler_plate/features/authentication/login_or_signup_screen/view/login_or_signup_screen.dart';
import 'package:bloc_boiler_plate/features/landing_page/view/landing_page_screen.dart';
import 'package:bloc_boiler_plate/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginOrSignupScreen = '/login_or_signup_screen';

  static const String loginScreen = '/login_screen';

  static const String landingPageScreen = '/landing_page';


  static Map<String, WidgetBuilder> get routes => {
    splashScreen: SplashScreen.builder,
    loginOrSignupScreen: LoginOrSignupScreen.builder,
    loginScreen: LoginScreen.builder,
    landingPageScreen: LandingPageScreen.builder
  };
}
