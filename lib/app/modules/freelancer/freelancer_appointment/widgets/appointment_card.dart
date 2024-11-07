import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lisha/app/domain/entities/appointment.dart';
import '../../../../extensions/text_styles/int_text_style_extension.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.white.withOpacity(0.1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
            const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      AppAssets.dateIcon,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      AppAssets.gearIcon,
                    ),
                    SvgPicture.asset(
                      AppAssets.arrowDownSharpIcon,
                    ),
                  ],
                ),
                const Gap(24),
                Text(
                  '30 Minute Meeting',
                  style: 18.0.semiBold,
                ),
                const Gap(8),
                Text(
                  '30 min, One-on-One',
                  style: 14.0.regular.copyWith(
                    color: AppColors.white
                        .withOpacity(0.7),
                  ),
                ),
                const Gap(16),
                Text(
                  'View booking page',
                  style: 14.0.regular,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.white.withOpacity(0.1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          AppAssets.copyIcon,
                        ),
                        const Gap(7),
                        Text(
                          'Copy link',
                          style: 14.0.regular.copyWith(
                              color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(24),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(32),
                      border: Border.all(
                        color: AppColors.primary,
                      ),
                    ),
                    child: Text(
                      'Share',
                      style: 16.0.regular.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}