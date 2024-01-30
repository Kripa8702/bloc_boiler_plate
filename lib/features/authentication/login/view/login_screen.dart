import 'package:bloc_boiler_plate/features/authentication/login/bloc/login_bloc.dart';
import 'package:bloc_boiler_plate/features/authentication/login/repository/auth_repository.dart';
import 'package:bloc_boiler_plate/features/widgets/custom_elevated_button.dart';
import 'package:bloc_boiler_plate/features/widgets/custom_text_form_field.dart';
import 'package:bloc_boiler_plate/localizations/app_localization.dart';
import 'package:bloc_boiler_plate/routing/app_routes.dart';
import 'package:bloc_boiler_plate/theme/app_styles.dart';
import 'package:bloc_boiler_plate/utils/navigator_service.dart';
import 'package:bloc_boiler_plate/utils/size_utils.dart';
import 'package:bloc_boiler_plate/validators/validation_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) =>
            LoginBloc(authRepo: context.read<AuthRepository>()),
        child: LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 11.v),
            child: Container(
              margin: EdgeInsets.only(bottom: 5.v),
              padding: EdgeInsets.symmetric(horizontal: 32.h),
              child: Column(
                children: [
                  _buildPageHeader(context),
                  SizedBox(height: 21.v),
                  // CustomImageView(
                  //     imagePath: ImageConstant.imgLogoGray5001113x116,
                  //     height: 113.v,
                  //     width: 116.h),
                  SizedBox(height: 115.v),
                  BlocSelector<LoginBloc, LoginState, TextEditingController?>(
                    selector: (state) => state.emailController,
                    builder: (context, emailController) {
                      return CustomTextFormField(
                          controller: emailController,
                          hintText: "lbl_email2".tr,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_email".tr;
                            }
                            return null;
                          },
                          borderDecoration:
                              TextFormFieldStyleHelper.outlineOnPrimaryTL14);
                    },
                  ),
                  SizedBox(height: 24.v),
                  BlocSelector<LoginBloc, LoginState, TextEditingController?>(
                    selector: (state) => state.passwordController,
                    builder: (context, passwordController) {
                      return CustomTextFormField(
                          controller: passwordController,
                          hintText: "lbl_password".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_password".tr;
                            }
                            return null;
                          },
                          obscureText: true,
                          borderDecoration:
                              TextFormFieldStyleHelper.outlineOnPrimaryTL14);
                    },
                  ),
                  SizedBox(height: 26.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {},
                          child: Text("msg_forgot_password".tr,
                              style: CustomTextStyles.labelLarge))),
                  SizedBox(height: 23.v),
                  CustomElevatedButton(
                    text: "lbl_next".tr,
                    onPressed: () {
                      NavigatorService.pushNamed(
                        AppRoutes.signupScreen,
                      );
                    },
                  ),
                  SizedBox(height: 33.v),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Text("msg_don_t_have_an_account".tr,
                                style: CustomTextStyles.labelLarge)),
                        Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text("lbl_signup2".tr,
                                style: CustomTextStyles.labelLarge))
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
        Container(
            width: 221.h,
            margin: EdgeInsets.only(right: 89.h),
            child: Text("msg_this_is_your_community".tr,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.displaySmall.copyWith(height: 1.18))),
        SizedBox(height: 1.v),
        Container(
            width: 282.h,
            margin: EdgeInsets.only(right: 28.h),
            child: Text("msg_our_community_is3".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.labelLarge.copyWith(height: 1.67)))
      ],
    );
  }
}
