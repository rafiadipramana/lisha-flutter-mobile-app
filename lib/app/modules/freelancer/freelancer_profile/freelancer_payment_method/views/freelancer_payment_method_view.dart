import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/freelancer_payment_method_controller.dart';
import '../../../../../config/app_assets.dart';
import '../../../../../config/app_colors.dart';
import '../../../../../widgets/app_elevated_button.dart';
import '../../../../../extensions/text_styles/int_text_style_extension.dart';

class FreelancerPaymentMethodView
    extends GetView<FreelancerPaymentMethodController> {
  const FreelancerPaymentMethodView({super.key});

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
                        'Payment methods',
                        style: 18.0.medium,
                      ),
                    ],
                  ),
                  const Gap(32),
                  Text(
                    'Choose your payment method',
                    style: 16.0.medium,
                  ),
                  const Gap(16),
                  const Column(
                    children: <Widget>[
                      PaymentMethodCard(
                        iconPath: AppAssets.stripeIcon,
                        cardNumber: 'XXXX XXXX XXXX 1234',
                        expiryDate: '12/24',
                        isSelected: true,
                      ),
                      Gap(16),
                      PaymentMethodCard(
                        iconPath: AppAssets.paypalIcon,
                        cardNumber: 'XXXX XXXX XXXX 5678',
                        expiryDate: '12/25',
                      ),
                      Gap(16),
                      PaymentMethodCard(
                        iconPath: AppAssets.mastercardIcon,
                        cardNumber: 'XXXX XXXX XXXX 9012',
                        expiryDate: '12/26',
                      ),
                    ],
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
                'Save',
                style: 14.0.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    this.onTap,
    required this.iconPath,
    required this.cardNumber,
    required this.expiryDate,
    this.isSelected = false,
  });

  final Function()? onTap;
  final String iconPath;
  final String cardNumber;
  final String expiryDate;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.02),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.white.withOpacity(0.1),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          iconPath,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      const Gap(14),
                      Flexible(
                        flex: 4,
                        child: Text(
                          cardNumber,
                          style: 16.0.medium,
                        ),
                      ),
                    ],
                  ),
                  const Gap(14),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Expiries:',
                          style: 14.0.regular,
                        ),
                      ),
                      const Gap(14),
                      Flexible(
                        flex: 4,
                        child: Text(
                          expiryDate,
                          style: 14.0.medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              isSelected
                  ? AppAssets.checkedIcon
                  : AppAssets.uncheckedIcon,
            ),
          ],
        ),
      ),
    );
  }
}
