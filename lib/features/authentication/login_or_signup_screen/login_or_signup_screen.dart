import 'package:bloc_boiler_plate/features/widgets/custom_elevated_button.dart';
import 'package:bloc_boiler_plate/features/widgets/custom_icon_button.dart';
import 'package:bloc_boiler_plate/localizations/app_localization.dart';
import 'package:bloc_boiler_plate/routing/app_routes.dart';
import 'package:bloc_boiler_plate/theme/app_styles.dart';
import 'package:bloc_boiler_plate/theme/colors.dart';
import 'package:bloc_boiler_plate/theme/custom_button_style.dart';
import 'package:bloc_boiler_plate/utils/navigator_service.dart';
import 'package:bloc_boiler_plate/utils/size_utils.dart';
import 'package:flutter/material.dart';

class LoginOrSignupScreen extends StatelessWidget {
  const LoginOrSignupScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return const LoginOrSignupScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 39.v),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17.h),
                child: CustomIconButton(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  padding: EdgeInsets.only(left: 5.h),
                  alignment: Alignment.centerLeft,
                  onTap: () {
                    NavigatorService.goBack();
                  },
                  child:
                      const Center(child: Icon(Icons.arrow_back_ios, size: 16)),
                ),
              ),
              SizedBox(height: 41.v),
              _buildPageHeader(context),
              SizedBox(height: 30.v),
              // CustomImageView(
              //     imagePath: ImageConstant.imgLogoGray5001,
              //     height: 105.v,
              //     width: 117.h),
              SizedBox(height: 33.v),
              Text(
                "lbl_get_in_through".tr,
                style:
                    CustomTextStyles.titleMedium.copyWith(color: primaryColor),
              ),
              SizedBox(height: 33.v),
              CustomElevatedButton(
                text: "lbl_sign_up".tr,
                buttonTextStyle: CustomTextStyles.titleMedium.copyWith(
                  color: secondaryTextColor,
                  fontSize: 16.fSize,
                ),
                buttonStyle: CustomButtonStyles.fillBlue,
                onPressed: () {
                  // NavigatorService.pushNamed(
                  //   AppRoutes.signupScreen,
                  // );
                },
              ),
              SizedBox(height: 14.v),
              CustomElevatedButton(
                text: "lbl_login".tr,
                buttonStyle: CustomButtonStyles.fillDeepOrange,
                buttonTextStyle: CustomTextStyles.titleMedium.copyWith(
                  color: secondaryTextColor,
                  fontSize: 16.fSize,
                ),
                onPressed: () {
                  NavigatorService.pushNamed(
                    AppRoutes.loginScreen,
                  );
                },
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPageHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 208.h,
          child: Text(
            "msg_welcome_to_our_community".tr,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.displaySmall,
          ),
        ),
        SizedBox(height: 2.v),
        Container(
          width: 281.h,
          margin: EdgeInsets.only(right: 29.h),
          child: Text(
            "msg_our_community_is".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodySmall,
          ),
        )
      ],
    );
  }
}
