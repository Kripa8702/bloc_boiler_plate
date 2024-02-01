import 'package:bloc_boiler_plate/features/authentication/login/bloc/login_bloc.dart';
import 'package:bloc_boiler_plate/features/authentication/repository/auth_repository.dart';
import 'package:bloc_boiler_plate/features/widgets/custom_elevated_button.dart';
import 'package:bloc_boiler_plate/features/widgets/custom_text_form_field.dart';
import 'package:bloc_boiler_plate/localizations/app_localization.dart';
import 'package:bloc_boiler_plate/routing/app_routes.dart';
import 'package:bloc_boiler_plate/theme/app_styles.dart';
import 'package:bloc_boiler_plate/theme/colors.dart';
import 'package:bloc_boiler_plate/theme/custom_button_style.dart';
import 'package:bloc_boiler_plate/utils/navigator_service.dart';
import 'package:bloc_boiler_plate/utils/size_utils.dart';
import 'package:bloc_boiler_plate/validators/validation_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) =>
            LoginBloc(authRepo: context.read<AuthRepository>()),
        child: const LoginScreen());
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state.status == LoginStatus.success) {
          NavigatorService.pushNamedAndRemoveUntil(
              AppRoutes.landingPageScreen);
        }
      },
      builder: (context, state) {
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
                      SizedBox(height: 115.v),
                      CustomTextFormField(
                        controller: emailController,
                        hintText: "lbl_username".tr,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              (!isText(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_email".tr;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 24.v),
                      CustomTextFormField(
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
                      ),
                      SizedBox(height: 26.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "msg_forgot_password".tr,
                            style: CustomTextStyles.labelLarge
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 55.v),
                      CustomElevatedButton(
                        text: "lbl_next".tr,
                        buttonStyle: CustomButtonStyles.fillBlue,
                        buttonTextStyle: CustomTextStyles.titleMedium.copyWith(
                          color: secondaryTextColor,
                          fontSize: 16.fSize,
                        ),
                        isLoading: state.status == LoginStatus.loading,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(Login(
                                email: emailController.text,
                                password: passwordController.text));

                          }
                        },
                      ),
                      SizedBox(height: 28.v),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: Text("msg_don_t_have_an_account".tr,
                                  style: CustomTextStyles.labelLarge),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text(
                                "lbl_sign_up".tr,
                                style: CustomTextStyles.labelLarge.copyWith(
                                    decoration: TextDecoration.underline),
                              ),
                            )
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
      },
    );
  }

  /// Section Widget
  Widget _buildPageHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 221.h,
          margin: EdgeInsets.only(top: 55.v, right: 89.h),
          child: Text(
            "lbl_login".tr,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.displaySmall.copyWith(height: 1.18),
          ),
        ),
        SizedBox(height: 1.v),
        Container(
          width: 282.h,
          margin: EdgeInsets.only(right: 28.h),
          child: Text(
            "msg_lorem_ipsum_dolor".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.labelLarge.copyWith(height: 1.67),
          ),
        )
      ],
    );
  }
}
