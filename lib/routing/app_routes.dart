import 'package:bloc_boiler_plate/features/authentication/login/view/login_screen.dart';
import 'package:bloc_boiler_plate/features/authentication/login_or_signup_screen/login_or_signup_screen.dart';
import 'package:bloc_boiler_plate/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginOrSignupScreen = '/login_or_signup_screen';

  static const String signupScreen = '/signup_screen';

  static const String loginScreen = '/login_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String homeScreen = '/home_screen';

  static const String personalityScreen = '/personality_screen';

  static const String workTodayScreen = '/work_today_screen';

  static const String wishListScreen = '/wish_list_screen';

  static const String settingsScreen = '/settings_screen';

  static const String languageScreen = '/language_screen';

  static const String termsandconditionsScreen = '/termsandconditions_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    splashScreen: SplashScreen.builder,
    loginOrSignupScreen: LoginOrSignupScreen.builder,
    // signupScreen: SignupScreen.builder,
    loginScreen: LoginScreen.builder,
    // forgotPasswordScreen: ForgotPasswordScreen.builder,
    // homeScreen: HomeScreen.builder,
    // personalityScreen: PersonalityScreen.builder,
    // workTodayScreen: WorkTodayScreen.builder,
    // wishListScreen: WishListScreen.builder,
    // settingsScreen: SettingsScreen.builder,
    // languageScreen: LanguageScreen.builder,
    // termsandconditionsScreen: TermsandconditionsScreen.builder,
    // appNavigationScreen: AppNavigationScreen.builder,
    // initialRoute: AdacanaScreen.builder
  };
}
