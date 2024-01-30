import 'package:bloc_boiler_plate/constants/assets_constants.dart';
import 'package:bloc_boiler_plate/features/splash/bloc/splash_bloc.dart';
import 'package:bloc_boiler_plate/features/widgets/custom_image_view.dart';
import 'package:bloc_boiler_plate/routing/app_routes.dart';
import 'package:bloc_boiler_plate/utils/navigator_service.dart';
import 'package:bloc_boiler_plate/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) => SplashBloc()..add(SplashInitial()),
        child: const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 1.v),
                  CustomImageView(
                    imagePath: appLogo,
                    height: 325.v,
                    width: 238.h,
                    onTap: () {
                      onTapImgLogo(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Navigates to the loginOrSignupScreen when the tapped on the logo.
  onTapImgLogo(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginOrSignupScreen,
    );
  }
}
