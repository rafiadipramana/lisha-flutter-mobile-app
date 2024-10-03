import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/util/validator_util.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../extensions/text_styles/int_text_style_extension.dart';
import '../../../../widgets/app_elevated_button.dart';
import '../../../../widgets/app_underlined_text_form_field.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Stack(
      children: <Widget>[
        /// Background
        Material(
          child: Ink.image(
            image: const AssetImage(AppAssets.authBackground),
            fit: BoxFit.cover,
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Gap(paddingTop),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        return const Gap(32);
                      } else {
                        return const Gap(145);
                      }
                    }
                  ),
                  Image.asset(
                    AppAssets.appLogo,
                    width: 75,
                  ),
                  const Gap(32),
                  Center(
                    child: Text(
                      'Forgot password',
                      style: 24.0.medium,
                    ),
                  ),
                  const Gap(27),
                  Form(
                    key: controller.forgotPasswordFormKey,
                    child: AppUnderlinedTextFormField(
                      controller: controller.emailController,
                      labelText: 'Email address',
                      validator: ValidatorUtil.validateEmail,
                    ),
                  ),
                  const Gap(32),
                  AppElevatedButton(
                    onPressed: controller.validateForm,
                    child: Text(
                      'Send Reset Link',
                      style: 16.0.medium.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account? ',
                        style: 16.0.regular,
                      ),
                      GestureDetector(
                        onTap: controller.navigateToRegister,
                        child: Text(
                          'Sign up',
                          style: 16.0.regular.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
