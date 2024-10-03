import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/modules/freelancer/freelancer_profile/controllers/freelancer_profile_controller.dart';
import 'package:lisha/app/widgets/app_elevated_button.dart';

class FreelancerProfileView extends GetView<FreelancerProfileController> {
  const FreelancerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Material(
          child: Ink.image(
            image: const AssetImage(
              AppAssets.serviceBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildHeader(paddingTop, size),
                _buildInventorySection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _buildInventorySection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Inventories',
            style: 16.0.medium,
          ),
          const Gap(12),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: <Widget>[
                InventoryItem(
                  iconPath: AppAssets.cardIcon,
                  title: 'Change payment method',
                  onTap: () {},
                ),
                InventoryItem(
                  iconPath: AppAssets.currencyIcon,
                  title: 'Change subscription',
                  onTap: () {},
                ),
                InventoryItem(
                  iconPath: AppAssets.bellIcon,
                  title: 'Notification',
                  onTap: () {},
                ),
                InventoryItem(
                  iconPath: AppAssets.tagIcon,
                  title: 'Set Offer',
                  onTap: () {},
                ),
                InventoryItem(
                  iconPath: AppAssets.keySquareIcon,
                  title: 'Change Password',
                  onTap: () {},
                ),
                InventoryItem(
                  iconPath: AppAssets.logoutIcon,
                  title: 'Logout',
                  onTap: controller.displayConfirmationDialog,
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack _buildHeader(double paddingTop, Size size) {
    return Stack(
      children: <Widget>[
        Image.asset(
          AppAssets.profileHeaderBackground,
        ),
        Ink(
          decoration: const BoxDecoration(
            color: AppColors.black100,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Gap(paddingTop),
                const Gap(24),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    AppAssets.profilePictureDummy,
                  ),
                ),
                const Gap(16),
                Text(
                  'Anna Kendrick',
                  style: 32.0.bold,
                ),
                const Gap(12),
                Text(
                  'Product Designer',
                  style: 14.0.medium.copyWith(
                        color: AppColors.white.withOpacity(0.7),
                      ),
                ),
                const Gap(24),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.3,
                  ),
                  child: AppElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Edit profile',
                      style: 14.0.semiBold,
                    ),
                  ),
                ),
                const Gap(24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class InventoryItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final Function()? onTap;
  final bool isLast;

  const InventoryItem({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                  color: AppColors.white.withOpacity(0.08),
                ),
              ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: <Widget>[
            Ink(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.white.withOpacity(0.1),
                ),
                gradient: AppColors.primaryVariantGradientWithOpacity(
                  opacity: 0.16,
                ),
              ),
              child: SvgPicture.asset(
                iconPath,
              ),
            ),
            const Gap(12),
            Text(
              title,
              style: 16.0.regular,
            ),
            const Spacer(),
            SvgPicture.asset(
              AppAssets.arrowRightIcon,
            ),
          ],
        ),
      ),
    );
  }
}
