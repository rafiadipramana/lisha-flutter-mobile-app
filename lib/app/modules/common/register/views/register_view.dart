import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/util/validator_util.dart';
import '../../../../extensions/text_styles/int_text_style_extension.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../widgets/app_elevated_button.dart';
import '../../../../widgets/app_underlined_text_form_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
                  Form(
                    key: controller.registerFormKey,
                    child: Column(
                      children: <Widget>[
                        const Gap(32),
                        AppUnderlinedTextFormField(
                          controller: controller.usernameAndEmailController,
                          labelText: 'Username or Email',
                          validator: ValidatorUtil.validateEmail,
                        ),
                        const Gap(32),
                        AppUnderlinedTextFormField(
                          controller: controller.firstNameController,
                          labelText: 'First Name',
                          validator: ValidatorUtil.validateIsEmpty,
                        ),
                        const Gap(32),
                        AppUnderlinedTextFormField(
                          controller: controller.lastNameController,
                          labelText: 'Last Name',
                          validator: ValidatorUtil.validateIsEmpty,
                        ),
                        const Gap(32),
                        AppUnderlinedTextFormField(
                          controller: controller.countryController,
                          labelText: 'Country',
                          validator: ValidatorUtil.validateIsEmpty,
                        ),
                        const Gap(32),
                        AppUnderlinedTextFormField(
                          obscureText: true,
                          controller: controller.passwordController,
                          labelText: 'Password',
                          validator: ValidatorUtil.validatePassword,
                        ),
                        const Gap(32),
                        AppUnderlinedTextFormField(
                          obscureText: true,
                          controller: controller.confirmPasswordController,
                          labelText: 'Confirm Password',
                          validator: (String? value) {
                            return ValidatorUtil.validateConfirmPassword(
                              controller.passwordController.text,
                              value,
                            );
                          },
                          textInputAction: TextInputAction.done,
                        ),
                        const Gap(32),
                      ],
                    ),
                  ),
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
                        'Log Up',
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
                        'Already have an account? ',
                        style: 16.0.regular,
                      ),
                      GestureDetector(
                        onTap: controller.navigateToLoginPage,
                        child: Text(
                          'Sign in',
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
