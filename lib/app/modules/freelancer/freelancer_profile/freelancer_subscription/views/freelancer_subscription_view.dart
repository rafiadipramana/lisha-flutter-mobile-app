import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';

import '../../../../../config/app_assets.dart';
import '../../../../../config/app_colors.dart';
import '../../../../../widgets/app_elevated_button.dart';
import '../controllers/freelancer_subscription_controller.dart';

class FreelancerSubscriptionView
    extends GetView<FreelancerSubscriptionController> {
  const FreelancerSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Stack(
      children: <Widget>[
        // Background
        Material(
          child: Ink.image(
            image: const AssetImage(
              AppAssets.portfolioBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Gap(paddingTop),
                  const Gap(23),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: controller.back,
                        borderRadius: BorderRadius.circular(100),
                        child: Ink(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white.withOpacity(0.06),
                            border: Border.all(
                              color: AppColors.white.withOpacity(0.1),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                          ),
                        ),
                      ),
                      const Gap(16),
                      Text(
                        'Choose Duration',
                        style: 18.0.medium,
                      ),
                    ],
                  ),
                  const Gap(24),
                  Ink(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(24),
                      border: GradientBoxBorder(
                        gradient: AppColors.primaryGradient,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppOutlinedTextFormField(
                          label: 'Duration',
                          hintText: '1 month',
                          controller: TextEditingController(),
                        ),
                        const Gap(12),
                        AppOutlinedTextFormField(
                          label: 'Price',
                          hintText: '100',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.number,
                        ),
                        const Gap(12),
                        AppOutlinedTextFormField(
                          label: 'Description',
                          hintText: 'Description',
                          controller: TextEditingController(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 63,
          left: 24,
          right: 24,
          child: Material(
            type: MaterialType.transparency,
            child: AppElevatedButton(
              onPressed: () {},
              child: Text(
                'Save Subscription',
                style: 14.0.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppOutlinedTextFormField extends StatelessWidget {
  const AppOutlinedTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: 16.0.medium,
        ),
        const Gap(12),
        TextFormField(
          controller: controller,
          style: 16.0.regular,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: 16.0.regular.copyWith(
                  color: AppColors.white.withOpacity(0.5),
                ),
            filled: true,
            fillColor: AppColors.white.withOpacity(0.1),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColors.white.withOpacity(0.1),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColors.white.withOpacity(0.1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColors.white.withOpacity(0.1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
