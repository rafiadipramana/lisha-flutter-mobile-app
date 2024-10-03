import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/util/validator_util.dart';
import 'package:lisha/app/widgets/app_elevated_button.dart';
import 'package:lisha/app/widgets/app_underlined_text_form_field.dart';
import 'package:lisha/app/modules/common/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                  Image.asset(
                    AppAssets.appLogo,
                    width: 75,
                  ),
                  const Gap(32),
                  Center(
                    child: Text(
                      'Sign in to Lisha',
                      style: 24.0.medium,
                    ),
                  ),
                  const Gap(48),
                  AppElevatedButton(
                    onPressed: () {},
                    variant: AppElevatedButtonVariant.primaryVariant,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          AppAssets.googleIcon,
                        ),
                        const Gap(12),
                        Text(
                          'Sign in with Google',
                          style: 16.0.medium.copyWith(
                                color: AppColors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(),
                      ),
                      const Gap(16),
                      Text(
                        'or sign in with email',
                        style: 14.0.regular,
                      ),
                      const Gap(16),
                      const Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  Form(
                    key: controller.loginFormKey,
                    child: Column(
                      children: <Widget>[
                        const Gap(32),
                        AppUnderlinedTextFormField(
                          controller: controller.emailController,
                          labelText: 'Username or Email',
                          validator: ValidatorUtil.validateEmail,
                        ),
                        const Gap(32),
                        AppUnderlinedTextFormField(
                          obscureText: true,
                          controller: controller.passwordController,
                          labelText: 'Password',
                          textInputAction: TextInputAction.done,
                          validator: ValidatorUtil.validatePassword,
                        ),
                      ],
                    ),
                  ),
                  const Gap(8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: controller.navigateToForgotPasswordPage,
                      child: Text(
                        'Forgot password',
                        style: 16.0.regular,
                      ),
                    ),
                  ),
                  const Gap(32),
                  Obx(
                    () => AppElevatedButton(
                      onPressed: controller.isLoading ? null : controller.validateForm,
                      child: controller.isLoading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                            )
                          : Text(
                              'Log In',
                              style: 16.0.medium.copyWith(
                                    color: AppColors.white,
                                  ),
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
                        onTap: controller.navigateToRegisterPage,
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
