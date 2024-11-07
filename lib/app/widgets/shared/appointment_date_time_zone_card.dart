import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../extensions/text_styles/int_text_style_extension.dart';

class AppointmentDateTimeZoneCard extends StatelessWidget {
  const AppointmentDateTimeZoneCard({
    super.key,
    required this.topContentText,
    required this.middleContentText,
    required this.bottomContentText,
  });

  final String topContentText;
  final String middleContentText;
  final String bottomContentText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        children: <Widget>[
          Ink(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppColors.primaryVariantGradient,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  AppAssets.appointmentClockIcon,
                ),
                const Gap(10),
                Text(
                  topContentText,
                  style: 14.0.regular,
                ),
                const Gap(4),
                Text(
                  middleContentText,
                  style: 24.0.semiBold,
                ),
                Text(
                  bottomContentText,
                  style: 16.0.regular,
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset(
                  AppAssets.halfCircleGradientBackground,
                ),
                RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(
                    AppAssets.halfCircleGradientBackground,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}