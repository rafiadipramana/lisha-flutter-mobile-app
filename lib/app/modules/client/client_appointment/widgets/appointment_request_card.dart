import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../extensions/text_styles/int_text_style_extension.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';

class AppointmentRequestCard extends StatelessWidget {
  final String name;
  final String dateTime;

  const AppointmentRequestCard({
    super.key,
    required this.name,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: <Widget>[
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(
              AppAssets.profilePictureDummy,
            ),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: 16.0.regular,
                ),
                const Gap(4),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.access_time,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    const Gap(8),
                    Text(
                      dateTime,
                      style: 12.0.medium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}